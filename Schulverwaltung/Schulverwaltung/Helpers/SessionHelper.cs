namespace SchulVerwaltung.Helpers
{
    // Session helper class to manage user session data
    public static class SessionHelper
    {
        // Indicates whether a user is currently logged in based on the CurrentUserID
        public static bool IsLoggedIn => CurrentUserID > 0;

        // Properties to store the current user's session data
        public static int CurrentUserID   { get; private set; }
        public static string Username     { get; private set; }
        public static string Vollname     { get; private set; }
        public static UserRole Role       { get; private set; }

        // Enum to represent user roles in the system
        public enum UserRole
        {
            Schueler,
            Lehrer,
            Admin
        }

        // Method to log in a user and set the session data
        public static void Login(int userID, string username, string vollname, UserRole role)
        {
            CurrentUserID = userID;
            Username      = username;
            Vollname      = vollname;
            Role          = role;
        }

        // Method to log out the user and clear the session data
        public static void Logout()
        {
            CurrentUserID = 0;
            Username      = null;
            Vollname      = null;
            Role          = UserRole.Schueler;
        }


        public static bool IsAdmin => Role == UserRole.Admin;

        public static bool IsLehrer => Role == UserRole.Lehrer || Role == UserRole.Admin;
    }
}
