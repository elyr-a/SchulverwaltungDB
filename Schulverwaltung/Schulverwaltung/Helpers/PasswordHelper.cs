// Password helper 

using System;
using System.Security.Cryptography;
using System.Text;

namespace SchulVerwaltung.Helpers
{
    public static class PasswordHelper
    {
        // A fixed salt value for password hashing
        private const string AppSalt = "SchulVerwaltung2025";

        // Hashes the password using SHA256
        public static string HashPassword(string password, string username)
        {
            string saltedPassword = $"{password}{username.ToLower()}{AppSalt}";

            using (var sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(saltedPassword);
                byte[] hash  = sha256.ComputeHash(bytes);

                var sb = new StringBuilder();
                foreach (byte b in hash)
                    sb.Append(b.ToString("x2")); 

                return sb.ToString();
            }
        }

        // Verifies the input password against the stored hash
        public static bool VerifyPassword(string inputPassword, string username, string storedHash)
        {
            string inputHash = HashPassword(inputPassword, username);
            return string.Equals(inputHash, storedHash, StringComparison.OrdinalIgnoreCase);
        }

        // Validates the password against defined rules and returns an error message if invalid
        public static bool IsPasswordValid(string password, out string errorMessage)
        {
            errorMessage = string.Empty;

            if (string.IsNullOrWhiteSpace(password) || password.Length < 8)
            {
                errorMessage = "Password should be at least 8 characters long.";
                return false;
            }

            bool hasUpper  = false;
            bool hasDigit  = false;

            foreach (char c in password)
            {
                if (char.IsUpper(c))  hasUpper = true;
                if (char.IsDigit(c))  hasDigit = true;
            }

            if (!hasUpper)
            {
                errorMessage = "Password should at least contain one uppercase letter.";
                return false;
            }

            if (!hasDigit)
            {
                errorMessage = "Password should at least contain one number.";
                return false;
            }

            return true;
        }
    }
}
