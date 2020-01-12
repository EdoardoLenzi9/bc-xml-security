using System.Collections;

namespace Org.BouncyCastle.Crypto.Xml.Utils
{
    internal class EncodingUtils
    {
        private static readonly char[] s_hexValues = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
        internal static string EncodeHexString(byte[] sArray)
        {
            return EncodeHexString(sArray, 0, (uint)sArray.Length);
        }

        internal static string EncodeHexString(byte[] sArray, uint start, uint end)
        {
            string result = null;
            if (sArray != null)
            {
                char[] hexOrder = new char[(end - start) * 2];
                uint digit;
                for (uint i = start, j = 0; i < end; i++)
                {
                    digit = (uint)((sArray[i] & 0xf0) >> 4);
                    hexOrder[j++] = s_hexValues[digit];
                    digit = (uint)(sArray[i] & 0x0f);
                    hexOrder[j++] = s_hexValues[digit];
                }
                result = new string(hexOrder);
            }
            return result;
        }

        internal static byte[] DecodeHexString(string s)
        {
            string hexString = ParserUtils.DiscardWhiteSpaces(s);
            uint cbHex = (uint)hexString.Length / 2;
            byte[] hex = new byte[cbHex];
            int i = 0;
            for (int index = 0; index < cbHex; index++)
            {
                hex[index] = (byte)((HexToByte(hexString[i]) << 4) | HexToByte(hexString[i + 1]));
                i += 2;
            }
            return hex;
        }

        internal static byte HexToByte(char val)
        {
            if (val <= '9' && val >= '0')
                return (byte)(val - '0');
            else if (val >= 'a' && val <= 'f')
                return (byte)((val - 'a') + 10);
            else if (val >= 'A' && val <= 'F')
                return (byte)((val - 'A') + 10);
            else
                return 0xFF;
        }


        internal static byte[] ConvertIntToByteArray(int dwInput)
        {
            byte[] rgbTemp = new byte[8]; // int can never be greater than Int64
            int t1;  // t1 is remaining value to account for
            int t2;  // t2 is t1 % 256
            int i = 0;

            if (dwInput == 0) return new byte[1];
            t1 = dwInput;
            while (t1 > 0)
            {
                t2 = t1 % 256;
                rgbTemp[i] = (byte)t2;
                t1 = (t1 - t2) / 256;
                i++;
            }

            byte[] rgbOutput = new byte[i];

            for (int j = 0; j < i; j++)
            {
                rgbOutput[j] = rgbTemp[i - j - 1];
            }
            return rgbOutput;
        }

        internal static int ConvertByteArrayToInt(byte[] input)
        {

            int dwOutput = 0;
            for (int i = 0; i < input.Length; i++)
            {
                dwOutput *= 256;
                dwOutput += input[i];
            }
            return (dwOutput);
        }

        internal static int GetHexArraySize(byte[] hex)
        {
            int index = hex.Length;
            while (index-- > 0)
            {
                if (hex[index] != 0)
                    break;
            }
            return index + 1;
        }

        internal static Hashtable TokenizePrefixListString(string s)
        {
            Hashtable set = new Hashtable();
            if (s != null)
            {
                string[] prefixes = s.Split(null);
                foreach (string prefix in prefixes)
                {
                    if (prefix.Equals("#default"))
                    {
                        set.Add(string.Empty, true);
                    }
                    else if (prefix.Length > 0)
                    {
                        set.Add(prefix, true);
                    }
                }
            }
            return set;
        }
    }
}
