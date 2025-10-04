// dart format width=80
//Generated code

part of 'full_documentation.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$FullDocumentation extends FullDocumentation {
  _$FullDocumentation([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = FullDocumentation;

  @override
  Future<Response<CategoryListResponse>> _categoriesGet({
    String? sort,
    bool? paginationWithCount,
    int? paginationPage,
    int? paginationPageSize,
    int? paginationStart,
    int? paginationLimit,
    String? fields,
    String? populate,
    Object? filters,
    String? locale,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/categories');
    final Map<String, dynamic> $params = <String, dynamic>{
      'sort': sort,
      'pagination[withCount]': paginationWithCount,
      'pagination[page]': paginationPage,
      'pagination[pageSize]': paginationPageSize,
      'pagination[start]': paginationStart,
      'pagination[limit]': paginationLimit,
      'fields': fields,
      'populate': populate,
      'filters': filters,
      'locale': locale,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<CategoryListResponse, CategoryListResponse>($request);
  }

  @override
  Future<Response<CategoryResponse>> _categoriesPost({
    String? cacheControl,
    required CategoryRequest? body,
  }) {
    final Uri $url = Uri.parse('/categories');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<CategoryResponse, CategoryResponse>($request);
  }

  @override
  Future<Response<CategoryResponse>> _categoriesIdGet({
    required num? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/categories/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<CategoryResponse, CategoryResponse>($request);
  }

  @override
  Future<Response<CategoryResponse>> _categoriesIdPut({
    required num? id,
    String? cacheControl,
    required CategoryRequest? body,
  }) {
    final Uri $url = Uri.parse('/categories/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<CategoryResponse, CategoryResponse>($request);
  }

  @override
  Future<Response<int>> _categoriesIdDelete({
    required num? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/categories/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<int, int>($request);
  }

  @override
  Future<Response<ProductListResponse>> _productsGet({
    String? sort,
    bool? paginationWithCount,
    int? paginationPage,
    int? paginationPageSize,
    int? paginationStart,
    int? paginationLimit,
    String? fields,
    String? populate,
    Object? filters,
    String? locale,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/products');
    final Map<String, dynamic> $params = <String, dynamic>{
      'sort': sort,
      'pagination[withCount]': paginationWithCount,
      'pagination[page]': paginationPage,
      'pagination[pageSize]': paginationPageSize,
      'pagination[start]': paginationStart,
      'pagination[limit]': paginationLimit,
      'fields': fields,
      'populate': populate,
      'filters': filters,
      'locale': locale,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<ProductListResponse, ProductListResponse>($request);
  }

  @override
  Future<Response<ProductResponse>> _productsPost({
    String? cacheControl,
    required ProductRequest? body,
  }) {
    final Uri $url = Uri.parse('/products');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<ProductResponse>> _productsIdGet({
    required num? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/products/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<ProductResponse>> _productsIdPut({
    required num? id,
    String? cacheControl,
    required ProductRequest? body,
  }) {
    final Uri $url = Uri.parse('/products/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<ProductResponse, ProductResponse>($request);
  }

  @override
  Future<Response<int>> _productsIdDelete({
    required num? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/products/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<int, int>($request);
  }

  @override
  Future<Response<List<UploadFile>>> _uploadPost({
    String? cacheControl,
    String? path,
    String? refId,
    String? ref,
    String? field,
    required List<List<int>> files,
  }) {
    final Uri $url = Uri.parse('/upload');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>('path', path),
      PartValue<String?>('refId', refId),
      PartValue<String?>('ref', ref),
      PartValue<String?>('field', field),
      PartValueFile<List<List<int>>>('files', files),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<List<UploadFile>, UploadFile>($request);
  }

  @override
  Future<Response<List<UploadFile>>> _uploadIdIdPost({
    required String? id,
    String? cacheControl,
    Object? fileInfo,
    List<int>? files,
  }) {
    final Uri $url = Uri.parse('/upload?id={id}');
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<Object?>('fileInfo', fileInfo),
      PartValueFile<List<int>?>('files', files),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      parameters: $params,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<List<UploadFile>, UploadFile>($request);
  }

  @override
  Future<Response<List<UploadFile>>> _uploadFilesGet({String? cacheControl}) {
    final Uri $url = Uri.parse('/upload/files');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<List<UploadFile>, UploadFile>($request);
  }

  @override
  Future<Response<UploadFile>> _uploadFilesIdGet({
    required String? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/upload/files/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<UploadFile, UploadFile>($request);
  }

  @override
  Future<Response<UploadFile>> _uploadFilesIdDelete({
    required String? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/upload/files/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<UploadFile, UploadFile>($request);
  }

  @override
  Future<Response<dynamic>> _connectProviderGet({
    required String? provider,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/connect/${provider}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UsersPermissionsUserRegistration>> _authLocalPost({
    String? cacheControl,
    required AuthLocalPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/auth/local');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsUserRegistration,
      UsersPermissionsUserRegistration
    >($request);
  }

  @override
  Future<Response<UsersPermissionsUserRegistration>> _authLocalRegisterPost({
    String? cacheControl,
    required AuthLocalRegisterPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/auth/local/register');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsUserRegistration,
      UsersPermissionsUserRegistration
    >($request);
  }

  @override
  Future<Response<UsersPermissionsUserRegistration>> _authProviderCallbackGet({
    required String? provider,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/auth/${provider}/callback');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsUserRegistration,
      UsersPermissionsUserRegistration
    >($request);
  }

  @override
  Future<Response<AuthForgotPasswordPost$Response>> _authForgotPasswordPost({
    String? cacheControl,
    required AuthForgotPasswordPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/auth/forgot-password');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client
        .send<AuthForgotPasswordPost$Response, AuthForgotPasswordPost$Response>(
          $request,
        );
  }

  @override
  Future<Response<UsersPermissionsUserRegistration>> _authResetPasswordPost({
    String? cacheControl,
    required AuthResetPasswordPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/auth/reset-password');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsUserRegistration,
      UsersPermissionsUserRegistration
    >($request);
  }

  @override
  Future<Response<UsersPermissionsUserRegistration>> _authChangePasswordPost({
    String? cacheControl,
    required AuthChangePasswordPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/auth/change-password');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsUserRegistration,
      UsersPermissionsUserRegistration
    >($request);
  }

  @override
  Future<Response<dynamic>> _authEmailConfirmationGet({
    String? confirmation,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/auth/email-confirmation');
    final Map<String, dynamic> $params = <String, dynamic>{
      'confirmation': confirmation,
    };
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AuthSendEmailConfirmationPost$Response>>
  _authSendEmailConfirmationPost({
    String? cacheControl,
    required AuthSendEmailConfirmationPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/auth/send-email-confirmation');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      AuthSendEmailConfirmationPost$Response,
      AuthSendEmailConfirmationPost$Response
    >($request);
  }

  @override
  Future<Response<UsersPermissionsPermissionsGet$Response>>
  _usersPermissionsPermissionsGet({String? cacheControl}) {
    final Uri $url = Uri.parse('/users-permissions/permissions');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsPermissionsGet$Response,
      UsersPermissionsPermissionsGet$Response
    >($request);
  }

  @override
  Future<Response<UsersPermissionsRolesGet$Response>>
  _usersPermissionsRolesGet({String? cacheControl}) {
    final Uri $url = Uri.parse('/users-permissions/roles');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsRolesGet$Response,
      UsersPermissionsRolesGet$Response
    >($request);
  }

  @override
  Future<Response<UsersPermissionsRolesPost$Response>>
  _usersPermissionsRolesPost({
    String? cacheControl,
    required UsersPermissionsRoleRequest$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/users-permissions/roles');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsRolesPost$Response,
      UsersPermissionsRolesPost$Response
    >($request);
  }

  @override
  Future<Response<UsersPermissionsRolesIdGet$Response>>
  _usersPermissionsRolesIdGet({required String? id, String? cacheControl}) {
    final Uri $url = Uri.parse('/users-permissions/roles/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsRolesIdGet$Response,
      UsersPermissionsRolesIdGet$Response
    >($request);
  }

  @override
  Future<Response<UsersPermissionsRolesRolePut$Response>>
  _usersPermissionsRolesRolePut({
    required String? role,
    String? cacheControl,
    required UsersPermissionsRoleRequest$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/users-permissions/roles/${role}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsRolesRolePut$Response,
      UsersPermissionsRolesRolePut$Response
    >($request);
  }

  @override
  Future<Response<UsersPermissionsRolesRoleDelete$Response>>
  _usersPermissionsRolesRoleDelete({
    required String? role,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/users-permissions/roles/${role}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<
      UsersPermissionsRolesRoleDelete$Response,
      UsersPermissionsRolesRoleDelete$Response
    >($request);
  }

  @override
  Future<Response<List<UsersPermissionsUser>>> _usersGet({
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/users');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<List<UsersPermissionsUser>, UsersPermissionsUser>(
      $request,
    );
  }

  @override
  Future<Response<dynamic>> _usersPost({
    String? cacheControl,
    required UsersPost$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/users');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UsersPermissionsUser>> _usersIdGet({
    required String? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/users/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<UsersPermissionsUser, UsersPermissionsUser>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdPut({
    required String? id,
    String? cacheControl,
    required UsersIdPut$RequestBody? body,
  }) {
    final Uri $url = Uri.parse('/users/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdDelete({
    required String? id,
    String? cacheControl,
  }) {
    final Uri $url = Uri.parse('/users/${id}');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UsersPermissionsUser>> _usersMeGet({String? cacheControl}) {
    final Uri $url = Uri.parse('/users/me');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<UsersPermissionsUser, UsersPermissionsUser>($request);
  }

  @override
  Future<Response<num>> _usersCountGet({String? cacheControl}) {
    final Uri $url = Uri.parse('/users/count');
    final Map<String, String> $headers = {
      if (cacheControl != null) 'Cache-Control': cacheControl,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
      includeNullQueryVars: true,
    );
    return client.send<num, num>($request);
  }
}
