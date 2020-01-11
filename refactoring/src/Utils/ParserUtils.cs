using System;
using System.Text;

namespace Org.BouncyCastle.Crypto.Xml.Utils
{
    internal class ParserUtils
    {
        internal static string DiscardWhiteSpaces(string inputBuffer)
        {
            return DiscardWhiteSpaces(inputBuffer, 0, inputBuffer.Length);
        }


        internal static string DiscardWhiteSpaces(string inputBuffer, int inputOffset, int inputCount)
        {
            int i, iCount = 0;
            for (i = 0; i < inputCount; i++)
                if (char.IsWhiteSpace(inputBuffer[inputOffset + i])) iCount++;
            char[] rgbOut = new char[inputCount - iCount];
            iCount = 0;
            for (i = 0; i < inputCount; i++)
                if (!char.IsWhiteSpace(inputBuffer[inputOffset + i]))
                {
                    rgbOut[iCount++] = inputBuffer[inputOffset + i];
                }
            return new string(rgbOut);
        }

        internal static void SBReplaceCharWithString(StringBuilder sb, char oldChar, string newString)
        {
            int i = 0;
            int newStringLength = newString.Length;
            while (i < sb.Length)
            {
                if (sb[i] == oldChar)
                {
                    sb.Remove(i, 1);
                    sb.Insert(i, newString);
                    i += newStringLength;
                }
                else i++;
            }
        }

        internal static string EscapeCData(string data)
        {
            return EscapeTextData(data);
        }


        internal static string EscapeTextData(string data)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(data);
            sb.Replace("&", "&amp;");
            sb.Replace("<", "&lt;");
            sb.Replace(">", "&gt;");
            SBReplaceCharWithString(sb, (char)13, "&#xD;");
            return sb.ToString(); ;
        }

        internal static string EscapeAttributeValue(string value)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(value);
            sb.Replace("&", "&amp;");
            sb.Replace("<", "&lt;");
            sb.Replace("\"", "&quot;");
            SBReplaceCharWithString(sb, (char)9, "&#x9;");
            SBReplaceCharWithString(sb, (char)10, "&#xA;");
            SBReplaceCharWithString(sb, (char)13, "&#xD;");
            return sb.ToString();
        }

        internal static string EscapeWhitespaceData(string data)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(data);
            SBReplaceCharWithString(sb, (char)13, "&#xD;");
            return sb.ToString(); ;
        }

        internal static string ExtractIdFromLocalUri(string uri)
        {
            string idref = uri.Substring(1);

            // Deal with XPointer of type #xpointer(id("ID")). Other XPointer support isn't handled here and is anyway optional
            if (idref.StartsWith("xpointer(id(", StringComparison.Ordinal))
            {
                int startId = idref.IndexOf("id(", StringComparison.Ordinal);
                int endId = idref.IndexOf(")", StringComparison.Ordinal);
                if (endId < 0 || endId < startId + 3)
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidReference);
                idref = idref.Substring(startId + 3, endId - startId - 3);
                idref = idref.Replace("\'", "");
                idref = idref.Replace("\"", "");
            }
            return idref;
        }

        internal static string GetIdFromLocalUri(string uri, out bool discardComments)
        {
            string idref = uri.Substring(1);
            // initialize the return value
            discardComments = true;

            // Deal with XPointer of type #xpointer(id("ID")). Other XPointer support isn't handled here and is anyway optional
            if (idref.StartsWith("xpointer(id(", StringComparison.Ordinal))
            {
                int startId = idref.IndexOf("id(", StringComparison.Ordinal);
                int endId = idref.IndexOf(")", StringComparison.Ordinal);
                if (endId < 0 || endId < startId + 3)
                    throw new System.Security.Cryptography.CryptographicException(SR.Cryptography_Xml_InvalidReference);
                idref = idref.Substring(startId + 3, endId - startId - 3);
                idref = idref.Replace("\'", "");
                idref = idref.Replace("\"", "");
                discardComments = false;
            }
            return idref;
        }
    }
}
