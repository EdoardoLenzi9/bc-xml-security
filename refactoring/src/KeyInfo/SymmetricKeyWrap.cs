using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;
using System;
using System.Diagnostics.CodeAnalysis;

namespace Org.BouncyCastle.Crypto.Xml
{
    internal static class SymmetricKeyWrap
    {
        private readonly static byte[] s_rgbTripleDES_KW_IV = { 0x4a, 0xdd, 0xa2, 0x2c, 0x79, 0xe8, 0x21, 0x05 };
        private readonly static byte[] s_rgbAES_KW_IV = { 0xa6, 0xa6, 0xa6, 0xa6, 0xa6, 0xa6, 0xa6, 0xa6 };

        [SuppressMessage("Microsoft.Cryptography", "CA5350", Justification = "Explicitly requested by the message contents")]
        internal static byte[] TripleDESKeyWrapEncrypt(byte[] rgbKey, byte[] rgbWrappedKeyData)
        {
            byte[] rgbCKS;

            var sha = DigestUtilities.GetDigest("SHA-1");
            rgbCKS = new byte[sha.GetDigestSize()];
            sha.BlockUpdate(rgbWrappedKeyData, 0, rgbWrappedKeyData.Length);
            sha.DoFinal(rgbCKS, 0);

            byte[] rgbIV = new byte[8];
            SecureRandom rng = new SecureRandom();
            rng.NextBytes(rgbIV);

            byte[] rgbWKCKS = new byte[rgbWrappedKeyData.Length + 8];
            IBufferedCipher enc1 = null;
            IBufferedCipher enc2 = null;

            try
            {
                enc1 = CipherUtilities.GetCipher("DESEDE/CBC/NOPADDING");
                enc2 = CipherUtilities.GetCipher("DESEDE/CBC/NOPADDING");
                enc1.Init(true, new ParametersWithIV(new DesEdeParameters(rgbKey), rgbIV));
                enc2.Init(true, new ParametersWithIV(new DesEdeParameters(rgbKey), s_rgbTripleDES_KW_IV));

                Buffer.BlockCopy(rgbWrappedKeyData, 0, rgbWKCKS, 0, rgbWrappedKeyData.Length);
                Buffer.BlockCopy(rgbCKS, 0, rgbWKCKS, rgbWrappedKeyData.Length, 8);
                byte[] temp1 = enc1.DoFinal(rgbWKCKS);
                byte[] temp2 = new byte[rgbIV.Length + temp1.Length];
                Buffer.BlockCopy(rgbIV, 0, temp2, 0, rgbIV.Length);
                Buffer.BlockCopy(temp1, 0, temp2, rgbIV.Length, temp1.Length);
                Array.Reverse(temp2);

                return enc2.DoFinal(temp2);
            }
            finally
            {

            }
        }

        [SuppressMessage("Microsoft.Cryptography", "CA5350", Justification = "Explicitly requested by the message contents")]
        internal static byte[] TripleDESKeyWrapDecrypt(byte[] rgbKey, byte[] rgbEncryptedWrappedKeyData)
        {
            if (rgbEncryptedWrappedKeyData.Length != 32 && rgbEncryptedWrappedKeyData.Length != 40
                && rgbEncryptedWrappedKeyData.Length != 48)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_KW_BadKeySize);

            IBufferedCipher dec1 = null;
            IBufferedCipher dec2 = null;

            try
            {
                dec1 = CipherUtilities.GetCipher("DESEDE/CBC/NOPADDING");
                dec2 = CipherUtilities.GetCipher("DESEDE/CBC/NOPADDING");
                
                dec1.Init(false, new ParametersWithIV(new DesEdeParameters(rgbKey), s_rgbTripleDES_KW_IV));

                byte[] temp2 = dec1.DoFinal(rgbEncryptedWrappedKeyData);
                Array.Reverse(temp2);
                byte[] rgbIV = new byte[8];
                Buffer.BlockCopy(temp2, 0, rgbIV, 0, 8);
                byte[] temp1 = new byte[temp2.Length - rgbIV.Length];
                Buffer.BlockCopy(temp2, 8, temp1, 0, temp1.Length);

                dec2.Init(false, new ParametersWithIV(new DesEdeParameters(rgbKey), rgbIV));
                byte[] rgbWKCKS = dec2.DoFinal(temp1);

                byte[] rgbWrappedKeyData = new byte[rgbWKCKS.Length - 8];
                Buffer.BlockCopy(rgbWKCKS, 0, rgbWrappedKeyData, 0, rgbWrappedKeyData.Length);
                var sha = DigestUtilities.GetDigest("SHA-1");
                byte[] rgbCKS = new byte[sha.GetDigestSize()];
                sha.BlockUpdate(rgbWrappedKeyData, 0, rgbWrappedKeyData.Length);
                sha.DoFinal(rgbCKS, 0);
                for (int index = rgbWrappedKeyData.Length, index1 = 0; index < rgbWKCKS.Length; index++, index1++)
                    if (rgbWKCKS[index] != rgbCKS[index1])
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_BadWrappedKeySize);
                return rgbWrappedKeyData;
            }
            finally
            {

            }
        }

        internal static byte[] AESKeyWrapEncrypt(byte[] rgbKey, byte[] rgbWrappedKeyData)
        {
            int N = rgbWrappedKeyData.Length >> 3;
            if ((rgbWrappedKeyData.Length % 8 != 0) || N <= 0)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_KW_BadKeySize);

            IBufferedCipher enc = null;

            try
            {
                enc = CipherUtilities.GetCipher("AES/ECB/NOPADDING");
                enc.Init(true, new KeyParameter(rgbKey));
                if (N == 1)
                {
                    byte[] temp = new byte[s_rgbAES_KW_IV.Length + rgbWrappedKeyData.Length];
                    Buffer.BlockCopy(s_rgbAES_KW_IV, 0, temp, 0, s_rgbAES_KW_IV.Length);
                    Buffer.BlockCopy(rgbWrappedKeyData, 0, temp, s_rgbAES_KW_IV.Length, rgbWrappedKeyData.Length);
                    return enc.DoFinal(temp);
                }
                long t = 0;
                byte[] rgbOutput = new byte[(N + 1) << 3];
                Buffer.BlockCopy(rgbWrappedKeyData, 0, rgbOutput, 8, rgbWrappedKeyData.Length);
                byte[] rgbA = new byte[8];
                byte[] rgbBlock = new byte[16];
                Buffer.BlockCopy(s_rgbAES_KW_IV, 0, rgbA, 0, 8);
                for (int j = 0; j <= 5; j++)
                {
                    for (int i = 1; i <= N; i++)
                    {
                        t = i + j * N;
                        Buffer.BlockCopy(rgbA, 0, rgbBlock, 0, 8);
                        Buffer.BlockCopy(rgbOutput, 8 * i, rgbBlock, 8, 8);
                        byte[] rgbB = enc.DoFinal(rgbBlock);
                        for (int k = 0; k < 8; k++)
                        {
                            byte tmp = (byte)((t >> (8 * (7 - k))) & 0xFF);
                            rgbA[k] = (byte)(tmp ^ rgbB[k]);
                        }
                        Buffer.BlockCopy(rgbB, 8, rgbOutput, 8 * i, 8);
                    }
                }
                Buffer.BlockCopy(rgbA, 0, rgbOutput, 0, 8);
                return rgbOutput;
            }
            finally
            {

            }
        }

        internal static byte[] AESKeyWrapDecrypt(byte[] rgbKey, byte[] rgbEncryptedWrappedKeyData)
        {
            int N = (rgbEncryptedWrappedKeyData.Length >> 3) - 1;
            if ((rgbEncryptedWrappedKeyData.Length % 8 != 0) || N <= 0)
                throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_KW_BadKeySize);

            byte[] rgbOutput = new byte[N << 3];
            IBufferedCipher dec = null;

            try
            {
                dec = CipherUtilities.GetCipher("AES/ECB/NOPADDING");
                dec.Init(false, new KeyParameter(rgbKey));

                if (N == 1)
                {
                    byte[] temp = dec.DoFinal(rgbEncryptedWrappedKeyData);
                    for (int index = 0; index < 8; index++)
                        if (temp[index] != s_rgbAES_KW_IV[index])
                            throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_BadWrappedKeySize);
                    Buffer.BlockCopy(temp, 8, rgbOutput, 0, 8);
                    return rgbOutput;
                }
                long t = 0;
                Buffer.BlockCopy(rgbEncryptedWrappedKeyData, 8, rgbOutput, 0, rgbOutput.Length);
                byte[] rgbA = new byte[8];
                byte[] rgbBlock = new byte[16];
                Buffer.BlockCopy(rgbEncryptedWrappedKeyData, 0, rgbA, 0, 8);
                for (int j = 5; j >= 0; j--)
                {
                    for (int i = N; i >= 1; i--)
                    {
                        t = i + j * N;
                        for (int k = 0; k < 8; k++)
                        {
                            byte tmp = (byte)((t >> (8 * (7 - k))) & 0xFF);
                            rgbA[k] ^= tmp;
                        }
                        Buffer.BlockCopy(rgbA, 0, rgbBlock, 0, 8);
                        Buffer.BlockCopy(rgbOutput, 8 * (i - 1), rgbBlock, 8, 8);
                        byte[] rgbB = dec.DoFinal(rgbBlock);
                        Buffer.BlockCopy(rgbB, 8, rgbOutput, 8 * (i - 1), 8);
                        Buffer.BlockCopy(rgbB, 0, rgbA, 0, 8);
                    }
                }
                for (int index = 0; index < 8; index++)
                    if (rgbA[index] != s_rgbAES_KW_IV[index])
                        throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_BadWrappedKeySize);
                return rgbOutput;
            }
            finally
            {

            }
        }
    }
}
