Namespace LightSwitchApplication
    Public Class ApplicationDataService

        Private Sub Providers_CanInsert(ByRef result As Boolean)
            'if the permission names match the method names then you can use the following to avoid hard strings
            'result = UserHasPermission(System.Reflection.MethodBase.GetCurrentMethod().Name.ToString())
            result = UserHasPermission("Providers_CanInsert")
        End Sub

        Private Sub Providers_CanUpdate(ByRef result As Boolean)
            result = UserHasPermission("Providers_CanUpdate")
        End Sub

        Private Sub Providers_CanDelete(ByRef result As Boolean)
            result = UserHasPermission("Providers_CanDelete")
        End Sub

        Private Sub Users_CanInsert(ByRef result As Boolean)
            result = True 'UserHasPermission("Users_CanInsert")
        End Sub

        Private Sub Users_CanUpdate(ByRef result As Boolean)
            result = UserHasPermission("Users_CanUpdate")
        End Sub

        Private Sub Users_CanDelete(ByRef result As Boolean)
            result = UserHasPermission("Users_CanDelete")
        End Sub

        Private Sub Clients_CanInsert(ByRef result As Boolean)
            result = UserHasPermission("Clients_CanInsert")
        End Sub

        Private Sub Clients_CanUpdate(ByRef result As Boolean)
            result = UserHasPermission("Clients_CanUpdate")
        End Sub

        Private Sub Clients_CanDelete(ByRef result As Boolean)
            result = UserHasPermission("Clients_CanDelete")
        End Sub

        Private Function UserHasPermission(PermissionName As String) As Boolean
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = PermissionName
                    Select UPerms
            Return Not IsNothing(query.SingleOrDefault)
        End Function

        Private Sub UserPermissions_PreprocessQuery(ByRef query As IQueryable(Of Permission))
            ''UserPremissions is a designer query having no filters or parameters
            ''
            ''you cannot do joins in the designer so all the guts are in code below
            ''
            ''something like this T-SQL:
            ''Declare @Application_User_Email nvarchar(max) =  N'josh@joshbooker.com';
            ''With UserRoles As
            ''(SELECT R.[Name] AS [Name]
            ''  FROM   [dbo].[UserRoles] As UR
            ''  INNER JOIN [dbo].[Users] As U On UR.[UserRole_User] = U.[Id]
            ''  INNER JOIN [dbo].[Roles] As R On UR.[UserRole_Role] = R.[Id]
            ''  WHERE U.[SPUser] =  @Application_User_Email
            '')
            ''Select Case P.Name 
            ''FROM   [RolePerms] As RP
            ''INNER JOIN [Roles] As R On RP.Role_RolePerm = R.Id
            ''INNER JOIN [Permissions] As P On RP.RolePerm_Permission = P.Id
            ''WHERE R.Name In (Select Name FROM UserRoles)
            ''
            ''notes to self:    perhaps roles and perms could be joined into a single query to reduce one trip to db 
            ''                  profiler this to see what it's doing to SQL - PreProcessQuery can get out of hand perf issues
            ''                  if its bad then we may need to cache the user role permissions list server-side - prolly should do that anyway
            ''                  https://blogs.msdn.microsoft.com/lightswitch/2013/07/25/use-caching-to-turbo-boost-your-lightswitch-apps-saar-shen/

            'get current user
            Dim uname As String = Me.Application.User.Email
            Dim roles As IEnumerable(Of String)
            Dim perms As IEnumerable(Of String)
            With Me.DataWorkspace.ApplicationData
                'query for list of user roles
                roles = .UserRoles.Where(Function(ur) ur.User.SPUser = uname).Select(Function(ur) ur.Role.Name).Execute().Distinct(StringComparer.Ordinal).ToList()
                'query for list of user role permissions
                perms = .RolePerms.Where(Function(rp) roles.Contains(rp.Role.Name)).Select(Function(rp) rp.Permission.Name).Execute().Distinct(StringComparer.Ordinal).ToList()
            End With
            'return permissions where list of user role permissions contains permission name
            query = query.Where(Function(p) perms.Contains(p.Name))
        End Sub

    End Class
End Namespace
