Namespace LightSwitchApplication
    Public Class ApplicationDataService

        Private Sub Providers_CanInsert(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Providers_CanInsert"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub Providers_CanUpdate(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Providers_CanUpdate"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub Providers_CanDelete(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Providers_CanDelete"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub Users_CanInsert(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Users_CanInsert"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub Users_CanUpdate(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Users_CanUpdate"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub Users_CanDelete(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Users_CanDelete"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub Clients_CanInsert(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Clients_CanInsert"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub Clients_CanUpdate(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Clients_CanUpdate"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub Clients_CanDelete(ByRef result As Boolean)
            Dim query As IDataServiceQueryable(Of Permission)
            query = From UPerms In Me.DataWorkspace.ApplicationData.UserPermissions()
                    Where UPerms.Name = "Clients_CanDelete"
                    Select UPerms
            result = Not IsNothing(query.SingleOrDefault)
        End Sub

        Private Sub UserPermissions_PreprocessQuery(ByRef query As IQueryable(Of Permission))
            'get current user
            Dim uname As String = Me.Application.User.Email
            Dim roles As IEnumerable(Of String)
            Dim perms As IEnumerable(Of String)
            With Me.DataWorkspace.ApplicationData
                'query for user roles
                roles = .UserRoles.Where(Function(ur) ur.User.SPUser = uname).Select(Function(ur) ur.Role.Name).Execute().Distinct(StringComparer.Ordinal).ToList()
                'query for user role permissions
                perms = .RolePerms.Where(Function(rp) roles.Contains(rp.Role.Name)).Select(Function(rp) rp.Permission.Name).Execute().Distinct(StringComparer.Ordinal).ToList()
            End With
            'return permissions matching user role permissions
            query = query.Where(Function(p) perms.Contains(p.Name))
        End Sub

    End Class
End Namespace
