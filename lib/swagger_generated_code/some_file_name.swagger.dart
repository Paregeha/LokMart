// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'some_file_name.enums.swagger.dart' as enums;
export 'some_file_name.enums.swagger.dart';

part 'some_file_name.swagger.chopper.dart';
part 'some_file_name.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class SomeFileName extends ChopperService {
  static SomeFileName create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$SomeFileName(client);
    }

    final newClient = ChopperClient(
      services: [_$SomeFileName()],
      converter: converter ?? $JsonSerializableConverter(),
      interceptors: interceptors ?? [],
      client: httpClient,
      authenticator: authenticator,
      errorConverter: errorConverter,
      baseUrl: baseUrl ?? Uri.parse('http://'),
    );
    return _$SomeFileName(newClient);
  }

  ///
  ///@param sort Sort by attributes ascending (asc) or descending (desc)
  ///@param pagination[withCount] Return page/pageSize (default: true)
  ///@param pagination[page] Page number (default: 0)
  ///@param pagination[pageSize] Page size (default: 25)
  ///@param pagination[start] Offset value (default: 0)
  ///@param pagination[limit] Number of entities to return (default: 25)
  ///@param fields Fields to return (ex: title,author)
  ///@param populate Relations to return
  ///@param filters Filters to apply
  ///@param locale Locale to apply
  Future<chopper.Response<CategoryListResponse>> categoriesGet({
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
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      CategoryListResponse,
      () => CategoryListResponse.fromJsonFactory,
    );

    return _categoriesGet(
      sort: sort,
      paginationWithCount: paginationWithCount,
      paginationPage: paginationPage,
      paginationPageSize: paginationPageSize,
      paginationStart: paginationStart,
      paginationLimit: paginationLimit,
      fields: fields,
      populate: populate,
      filters: filters,
      locale: locale,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///
  ///@param sort Sort by attributes ascending (asc) or descending (desc)
  ///@param pagination[withCount] Return page/pageSize (default: true)
  ///@param pagination[page] Page number (default: 0)
  ///@param pagination[pageSize] Page size (default: 25)
  ///@param pagination[start] Offset value (default: 0)
  ///@param pagination[limit] Number of entities to return (default: 25)
  ///@param fields Fields to return (ex: title,author)
  ///@param populate Relations to return
  ///@param filters Filters to apply
  ///@param locale Locale to apply
  @GET(path: '/categories', includeNullQueryVars: true)
  Future<chopper.Response<CategoryListResponse>> _categoriesGet({
    @Query('sort') String? sort,
    @Query('pagination[withCount]') bool? paginationWithCount,
    @Query('pagination[page]') int? paginationPage,
    @Query('pagination[pageSize]') int? paginationPageSize,
    @Query('pagination[start]') int? paginationStart,
    @Query('pagination[limit]') int? paginationLimit,
    @Query('fields') String? fields,
    @Query('populate') String? populate,
    @Query('filters') Object? filters,
    @Query('locale') String? locale,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<CategoryResponse>> categoriesPost({
    dynamic cacheControl,
    required CategoryRequest? body,
  }) {
    generatedMapping.putIfAbsent(
      CategoryResponse,
      () => CategoryResponse.fromJsonFactory,
    );

    return _categoriesPost(cacheControl: cacheControl?.toString(), body: body);
  }

  ///
  @POST(path: '/categories', optionalBody: true, includeNullQueryVars: true)
  Future<chopper.Response<CategoryResponse>> _categoriesPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required CategoryRequest? body,
  });

  ///
  ///@param id
  Future<chopper.Response<CategoryResponse>> categoriesIdGet({
    required num? id,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      CategoryResponse,
      () => CategoryResponse.fromJsonFactory,
    );

    return _categoriesIdGet(id: id, cacheControl: cacheControl?.toString());
  }

  ///
  ///@param id
  @GET(path: '/categories/{id}', includeNullQueryVars: true)
  Future<chopper.Response<CategoryResponse>> _categoriesIdGet({
    @Path('id') required num? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param id
  Future<chopper.Response<CategoryResponse>> categoriesIdPut({
    required num? id,
    dynamic cacheControl,
    required CategoryRequest? body,
  }) {
    generatedMapping.putIfAbsent(
      CategoryResponse,
      () => CategoryResponse.fromJsonFactory,
    );

    return _categoriesIdPut(
      id: id,
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///
  ///@param id
  @PUT(path: '/categories/{id}', optionalBody: true, includeNullQueryVars: true)
  Future<chopper.Response<CategoryResponse>> _categoriesIdPut({
    @Path('id') required num? id,
    @Header('Cache-Control') String? cacheControl,
    @Body() required CategoryRequest? body,
  });

  ///
  ///@param id
  Future<chopper.Response<int>> categoriesIdDelete({
    required num? id,
    dynamic cacheControl,
  }) {
    return _categoriesIdDelete(id: id, cacheControl: cacheControl?.toString());
  }

  ///
  ///@param id
  @DELETE(path: '/categories/{id}', includeNullQueryVars: true)
  Future<chopper.Response<int>> _categoriesIdDelete({
    @Path('id') required num? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param sort Sort by attributes ascending (asc) or descending (desc)
  ///@param pagination[withCount] Return page/pageSize (default: true)
  ///@param pagination[page] Page number (default: 0)
  ///@param pagination[pageSize] Page size (default: 25)
  ///@param pagination[start] Offset value (default: 0)
  ///@param pagination[limit] Number of entities to return (default: 25)
  ///@param fields Fields to return (ex: title,author)
  ///@param populate Relations to return
  ///@param filters Filters to apply
  ///@param locale Locale to apply
  Future<chopper.Response<ProductListResponse>> productsGet({
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
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      ProductListResponse,
      () => ProductListResponse.fromJsonFactory,
    );

    return _productsGet(
      sort: sort,
      paginationWithCount: paginationWithCount,
      paginationPage: paginationPage,
      paginationPageSize: paginationPageSize,
      paginationStart: paginationStart,
      paginationLimit: paginationLimit,
      fields: fields,
      populate: populate,
      filters: filters,
      locale: locale,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///
  ///@param sort Sort by attributes ascending (asc) or descending (desc)
  ///@param pagination[withCount] Return page/pageSize (default: true)
  ///@param pagination[page] Page number (default: 0)
  ///@param pagination[pageSize] Page size (default: 25)
  ///@param pagination[start] Offset value (default: 0)
  ///@param pagination[limit] Number of entities to return (default: 25)
  ///@param fields Fields to return (ex: title,author)
  ///@param populate Relations to return
  ///@param filters Filters to apply
  ///@param locale Locale to apply
  @GET(path: '/products', includeNullQueryVars: true)
  Future<chopper.Response<ProductListResponse>> _productsGet({
    @Query('sort') String? sort,
    @Query('pagination[withCount]') bool? paginationWithCount,
    @Query('pagination[page]') int? paginationPage,
    @Query('pagination[pageSize]') int? paginationPageSize,
    @Query('pagination[start]') int? paginationStart,
    @Query('pagination[limit]') int? paginationLimit,
    @Query('fields') String? fields,
    @Query('populate') String? populate,
    @Query('filters') Object? filters,
    @Query('locale') String? locale,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<ProductResponse>> productsPost({
    dynamic cacheControl,
    required ProductRequest? body,
  }) {
    generatedMapping.putIfAbsent(
      ProductResponse,
      () => ProductResponse.fromJsonFactory,
    );

    return _productsPost(cacheControl: cacheControl?.toString(), body: body);
  }

  ///
  @POST(path: '/products', optionalBody: true, includeNullQueryVars: true)
  Future<chopper.Response<ProductResponse>> _productsPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required ProductRequest? body,
  });

  ///
  ///@param id
  Future<chopper.Response<ProductResponse>> productsIdGet({
    required num? id,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      ProductResponse,
      () => ProductResponse.fromJsonFactory,
    );

    return _productsIdGet(id: id, cacheControl: cacheControl?.toString());
  }

  ///
  ///@param id
  @GET(path: '/products/{id}', includeNullQueryVars: true)
  Future<chopper.Response<ProductResponse>> _productsIdGet({
    @Path('id') required num? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param id
  Future<chopper.Response<ProductResponse>> productsIdPut({
    required num? id,
    dynamic cacheControl,
    required ProductRequest? body,
  }) {
    generatedMapping.putIfAbsent(
      ProductResponse,
      () => ProductResponse.fromJsonFactory,
    );

    return _productsIdPut(
      id: id,
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///
  ///@param id
  @PUT(path: '/products/{id}', optionalBody: true, includeNullQueryVars: true)
  Future<chopper.Response<ProductResponse>> _productsIdPut({
    @Path('id') required num? id,
    @Header('Cache-Control') String? cacheControl,
    @Body() required ProductRequest? body,
  });

  ///
  ///@param id
  Future<chopper.Response<int>> productsIdDelete({
    required num? id,
    dynamic cacheControl,
  }) {
    return _productsIdDelete(id: id, cacheControl: cacheControl?.toString());
  }

  ///
  ///@param id
  @DELETE(path: '/products/{id}', includeNullQueryVars: true)
  Future<chopper.Response<int>> _productsIdDelete({
    @Path('id') required num? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  Future<chopper.Response<List<UploadFile>>> uploadPost({
    dynamic cacheControl,
    String? path,
    String? refId,
    String? ref,
    String? field,
    required List<List<int>> files,
  }) {
    generatedMapping.putIfAbsent(UploadFile, () => UploadFile.fromJsonFactory);

    return _uploadPost(
      cacheControl: cacheControl?.toString(),
      path: path,
      refId: refId,
      ref: ref,
      field: field,
      files: files,
    );
  }

  ///
  @POST(path: '/upload', optionalBody: true, includeNullQueryVars: true)
  @Multipart()
  Future<chopper.Response<List<UploadFile>>> _uploadPost({
    @Header('Cache-Control') String? cacheControl,
    @Part('path') String? path,
    @Part('refId') String? refId,
    @Part('ref') String? ref,
    @Part('field') String? field,
    @PartFile() required List<List<int>> files,
  });

  ///
  ///@param id File id
  Future<chopper.Response<List<UploadFile>>> uploadIdIdPost({
    required String? id,
    dynamic cacheControl,
    Object? fileInfo,
    List<int>? files,
  }) {
    generatedMapping.putIfAbsent(UploadFile, () => UploadFile.fromJsonFactory);

    return _uploadIdIdPost(
      id: id,
      cacheControl: cacheControl?.toString(),
      fileInfo: fileInfo,
      files: files,
    );
  }

  ///
  ///@param id File id
  @POST(path: '/upload?id={id}', optionalBody: true, includeNullQueryVars: true)
  @Multipart()
  Future<chopper.Response<List<UploadFile>>> _uploadIdIdPost({
    @Query('id') required String? id,
    @Header('Cache-Control') String? cacheControl,
    @Part('fileInfo') Object? fileInfo,
    @PartFile() List<int>? files,
  });

  ///
  Future<chopper.Response<List<UploadFile>>> uploadFilesGet({
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(UploadFile, () => UploadFile.fromJsonFactory);

    return _uploadFilesGet(cacheControl: cacheControl?.toString());
  }

  ///
  @GET(path: '/upload/files', includeNullQueryVars: true)
  Future<chopper.Response<List<UploadFile>>> _uploadFilesGet({
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param id
  Future<chopper.Response<UploadFile>> uploadFilesIdGet({
    required String? id,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(UploadFile, () => UploadFile.fromJsonFactory);

    return _uploadFilesIdGet(id: id, cacheControl: cacheControl?.toString());
  }

  ///
  ///@param id
  @GET(path: '/upload/files/{id}', includeNullQueryVars: true)
  Future<chopper.Response<UploadFile>> _uploadFilesIdGet({
    @Path('id') required String? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///
  ///@param id
  Future<chopper.Response<UploadFile>> uploadFilesIdDelete({
    required String? id,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(UploadFile, () => UploadFile.fromJsonFactory);

    return _uploadFilesIdDelete(id: id, cacheControl: cacheControl?.toString());
  }

  ///
  ///@param id
  @DELETE(path: '/upload/files/{id}', includeNullQueryVars: true)
  Future<chopper.Response<UploadFile>> _uploadFilesIdDelete({
    @Path('id') required String? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Login with a provider
  ///@param provider Provider name
  Future<chopper.Response> connectProviderGet({
    required String? provider,
    dynamic cacheControl,
  }) {
    return _connectProviderGet(
      provider: provider,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Login with a provider
  ///@param provider Provider name
  @GET(path: '/connect/{provider}', includeNullQueryVars: true)
  Future<chopper.Response> _connectProviderGet({
    @Path('provider') required String? provider,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Local login
  Future<chopper.Response<UsersPermissionsUserRegistration>> authLocalPost({
    dynamic cacheControl,
    required AuthLocalPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsUserRegistration,
      () => UsersPermissionsUserRegistration.fromJsonFactory,
    );

    return _authLocalPost(cacheControl: cacheControl?.toString(), body: body);
  }

  ///Local login
  @POST(path: '/auth/local', optionalBody: true, includeNullQueryVars: true)
  Future<chopper.Response<UsersPermissionsUserRegistration>> _authLocalPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required AuthLocalPost$RequestBody? body,
  });

  ///Register a user
  Future<chopper.Response<UsersPermissionsUserRegistration>>
  authLocalRegisterPost({
    dynamic cacheControl,
    required AuthLocalRegisterPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsUserRegistration,
      () => UsersPermissionsUserRegistration.fromJsonFactory,
    );

    return _authLocalRegisterPost(
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///Register a user
  @POST(
    path: '/auth/local/register',
    optionalBody: true,
    includeNullQueryVars: true,
  )
  Future<chopper.Response<UsersPermissionsUserRegistration>>
  _authLocalRegisterPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required AuthLocalRegisterPost$RequestBody? body,
  });

  ///Default Callback from provider auth
  ///@param provider Provider name
  Future<chopper.Response<UsersPermissionsUserRegistration>>
  authProviderCallbackGet({required String? provider, dynamic cacheControl}) {
    generatedMapping.putIfAbsent(
      UsersPermissionsUserRegistration,
      () => UsersPermissionsUserRegistration.fromJsonFactory,
    );

    return _authProviderCallbackGet(
      provider: provider,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Default Callback from provider auth
  ///@param provider Provider name
  @GET(path: '/auth/{provider}/callback', includeNullQueryVars: true)
  Future<chopper.Response<UsersPermissionsUserRegistration>>
  _authProviderCallbackGet({
    @Path('provider') required String? provider,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Send rest password email
  Future<chopper.Response<AuthForgotPasswordPost$Response>>
  authForgotPasswordPost({
    dynamic cacheControl,
    required AuthForgotPasswordPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      AuthForgotPasswordPost$Response,
      () => AuthForgotPasswordPost$Response.fromJsonFactory,
    );

    return _authForgotPasswordPost(
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///Send rest password email
  @POST(
    path: '/auth/forgot-password',
    optionalBody: true,
    includeNullQueryVars: true,
  )
  Future<chopper.Response<AuthForgotPasswordPost$Response>>
  _authForgotPasswordPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required AuthForgotPasswordPost$RequestBody? body,
  });

  ///Rest user password
  Future<chopper.Response<UsersPermissionsUserRegistration>>
  authResetPasswordPost({
    dynamic cacheControl,
    required AuthResetPasswordPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsUserRegistration,
      () => UsersPermissionsUserRegistration.fromJsonFactory,
    );

    return _authResetPasswordPost(
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///Rest user password
  @POST(
    path: '/auth/reset-password',
    optionalBody: true,
    includeNullQueryVars: true,
  )
  Future<chopper.Response<UsersPermissionsUserRegistration>>
  _authResetPasswordPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required AuthResetPasswordPost$RequestBody? body,
  });

  ///Update user's own password
  Future<chopper.Response<UsersPermissionsUserRegistration>>
  authChangePasswordPost({
    dynamic cacheControl,
    required AuthChangePasswordPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsUserRegistration,
      () => UsersPermissionsUserRegistration.fromJsonFactory,
    );

    return _authChangePasswordPost(
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///Update user's own password
  @POST(
    path: '/auth/change-password',
    optionalBody: true,
    includeNullQueryVars: true,
  )
  Future<chopper.Response<UsersPermissionsUserRegistration>>
  _authChangePasswordPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required AuthChangePasswordPost$RequestBody? body,
  });

  ///Confirm user email
  ///@param confirmation confirmation token received by email
  Future<chopper.Response> authEmailConfirmationGet({
    String? confirmation,
    dynamic cacheControl,
  }) {
    return _authEmailConfirmationGet(
      confirmation: confirmation,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Confirm user email
  ///@param confirmation confirmation token received by email
  @GET(path: '/auth/email-confirmation', includeNullQueryVars: true)
  Future<chopper.Response> _authEmailConfirmationGet({
    @Query('confirmation') String? confirmation,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Send confirmation email
  Future<chopper.Response<AuthSendEmailConfirmationPost$Response>>
  authSendEmailConfirmationPost({
    dynamic cacheControl,
    required AuthSendEmailConfirmationPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      AuthSendEmailConfirmationPost$Response,
      () => AuthSendEmailConfirmationPost$Response.fromJsonFactory,
    );

    return _authSendEmailConfirmationPost(
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///Send confirmation email
  @POST(
    path: '/auth/send-email-confirmation',
    optionalBody: true,
    includeNullQueryVars: true,
  )
  Future<chopper.Response<AuthSendEmailConfirmationPost$Response>>
  _authSendEmailConfirmationPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required AuthSendEmailConfirmationPost$RequestBody? body,
  });

  ///Get default generated permissions
  Future<chopper.Response<UsersPermissionsPermissionsGet$Response>>
  usersPermissionsPermissionsGet({dynamic cacheControl}) {
    generatedMapping.putIfAbsent(
      UsersPermissionsPermissionsGet$Response,
      () => UsersPermissionsPermissionsGet$Response.fromJsonFactory,
    );

    return _usersPermissionsPermissionsGet(
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Get default generated permissions
  @GET(path: '/users-permissions/permissions', includeNullQueryVars: true)
  Future<chopper.Response<UsersPermissionsPermissionsGet$Response>>
  _usersPermissionsPermissionsGet({
    @Header('Cache-Control') String? cacheControl,
  });

  ///List roles
  Future<chopper.Response<UsersPermissionsRolesGet$Response>>
  usersPermissionsRolesGet({dynamic cacheControl}) {
    generatedMapping.putIfAbsent(
      UsersPermissionsRolesGet$Response,
      () => UsersPermissionsRolesGet$Response.fromJsonFactory,
    );

    return _usersPermissionsRolesGet(cacheControl: cacheControl?.toString());
  }

  ///List roles
  @GET(path: '/users-permissions/roles', includeNullQueryVars: true)
  Future<chopper.Response<UsersPermissionsRolesGet$Response>>
  _usersPermissionsRolesGet({@Header('Cache-Control') String? cacheControl});

  ///Create a role
  Future<chopper.Response<UsersPermissionsRolesPost$Response>>
  usersPermissionsRolesPost({
    dynamic cacheControl,
    required UsersPermissionsRoleRequest$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsRolesPost$Response,
      () => UsersPermissionsRolesPost$Response.fromJsonFactory,
    );

    return _usersPermissionsRolesPost(
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///Create a role
  @POST(
    path: '/users-permissions/roles',
    optionalBody: true,
    includeNullQueryVars: true,
  )
  Future<chopper.Response<UsersPermissionsRolesPost$Response>>
  _usersPermissionsRolesPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required UsersPermissionsRoleRequest$RequestBody? body,
  });

  ///Get a role
  ///@param id role Id
  Future<chopper.Response<UsersPermissionsRolesIdGet$Response>>
  usersPermissionsRolesIdGet({required String? id, dynamic cacheControl}) {
    generatedMapping.putIfAbsent(
      UsersPermissionsRolesIdGet$Response,
      () => UsersPermissionsRolesIdGet$Response.fromJsonFactory,
    );

    return _usersPermissionsRolesIdGet(
      id: id,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Get a role
  ///@param id role Id
  @GET(path: '/users-permissions/roles/{id}', includeNullQueryVars: true)
  Future<chopper.Response<UsersPermissionsRolesIdGet$Response>>
  _usersPermissionsRolesIdGet({
    @Path('id') required String? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update a role
  ///@param role role Id
  Future<chopper.Response<UsersPermissionsRolesRolePut$Response>>
  usersPermissionsRolesRolePut({
    required String? role,
    dynamic cacheControl,
    required UsersPermissionsRoleRequest$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsRolesRolePut$Response,
      () => UsersPermissionsRolesRolePut$Response.fromJsonFactory,
    );

    return _usersPermissionsRolesRolePut(
      role: role,
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///Update a role
  ///@param role role Id
  @PUT(
    path: '/users-permissions/roles/{role}',
    optionalBody: true,
    includeNullQueryVars: true,
  )
  Future<chopper.Response<UsersPermissionsRolesRolePut$Response>>
  _usersPermissionsRolesRolePut({
    @Path('role') required String? role,
    @Header('Cache-Control') String? cacheControl,
    @Body() required UsersPermissionsRoleRequest$RequestBody? body,
  });

  ///Delete a role
  ///@param role role Id
  Future<chopper.Response<UsersPermissionsRolesRoleDelete$Response>>
  usersPermissionsRolesRoleDelete({
    required String? role,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsRolesRoleDelete$Response,
      () => UsersPermissionsRolesRoleDelete$Response.fromJsonFactory,
    );

    return _usersPermissionsRolesRoleDelete(
      role: role,
      cacheControl: cacheControl?.toString(),
    );
  }

  ///Delete a role
  ///@param role role Id
  @DELETE(path: '/users-permissions/roles/{role}', includeNullQueryVars: true)
  Future<chopper.Response<UsersPermissionsRolesRoleDelete$Response>>
  _usersPermissionsRolesRoleDelete({
    @Path('role') required String? role,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Get list of users
  Future<chopper.Response<List<UsersPermissionsUser>>> usersGet({
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsUser,
      () => UsersPermissionsUser.fromJsonFactory,
    );

    return _usersGet(cacheControl: cacheControl?.toString());
  }

  ///Get list of users
  @GET(path: '/users', includeNullQueryVars: true)
  Future<chopper.Response<List<UsersPermissionsUser>>> _usersGet({
    @Header('Cache-Control') String? cacheControl,
  });

  ///Create a user
  Future<chopper.Response> usersPost({
    dynamic cacheControl,
    required UsersPost$RequestBody? body,
  }) {
    return _usersPost(cacheControl: cacheControl?.toString(), body: body);
  }

  ///Create a user
  @POST(path: '/users', optionalBody: true, includeNullQueryVars: true)
  Future<chopper.Response> _usersPost({
    @Header('Cache-Control') String? cacheControl,
    @Body() required UsersPost$RequestBody? body,
  });

  ///Get a user
  ///@param id user Id
  Future<chopper.Response<UsersPermissionsUser>> usersIdGet({
    required String? id,
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsUser,
      () => UsersPermissionsUser.fromJsonFactory,
    );

    return _usersIdGet(id: id, cacheControl: cacheControl?.toString());
  }

  ///Get a user
  ///@param id user Id
  @GET(path: '/users/{id}', includeNullQueryVars: true)
  Future<chopper.Response<UsersPermissionsUser>> _usersIdGet({
    @Path('id') required String? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Update a user
  ///@param id user Id
  Future<chopper.Response> usersIdPut({
    required String? id,
    dynamic cacheControl,
    required UsersIdPut$RequestBody? body,
  }) {
    return _usersIdPut(
      id: id,
      cacheControl: cacheControl?.toString(),
      body: body,
    );
  }

  ///Update a user
  ///@param id user Id
  @PUT(path: '/users/{id}', optionalBody: true, includeNullQueryVars: true)
  Future<chopper.Response> _usersIdPut({
    @Path('id') required String? id,
    @Header('Cache-Control') String? cacheControl,
    @Body() required UsersIdPut$RequestBody? body,
  });

  ///Delete a user
  ///@param id user Id
  Future<chopper.Response> usersIdDelete({
    required String? id,
    dynamic cacheControl,
  }) {
    return _usersIdDelete(id: id, cacheControl: cacheControl?.toString());
  }

  ///Delete a user
  ///@param id user Id
  @DELETE(path: '/users/{id}', includeNullQueryVars: true)
  Future<chopper.Response> _usersIdDelete({
    @Path('id') required String? id,
    @Header('Cache-Control') String? cacheControl,
  });

  ///Get authenticated user info
  Future<chopper.Response<UsersPermissionsUser>> usersMeGet({
    dynamic cacheControl,
  }) {
    generatedMapping.putIfAbsent(
      UsersPermissionsUser,
      () => UsersPermissionsUser.fromJsonFactory,
    );

    return _usersMeGet(cacheControl: cacheControl?.toString());
  }

  ///Get authenticated user info
  @GET(path: '/users/me', includeNullQueryVars: true)
  Future<chopper.Response<UsersPermissionsUser>> _usersMeGet({
    @Header('Cache-Control') String? cacheControl,
  });

  ///Get user count
  Future<chopper.Response<num>> usersCountGet({dynamic cacheControl}) {
    return _usersCountGet(cacheControl: cacheControl?.toString());
  }

  ///Get user count
  @GET(path: '/users/count', includeNullQueryVars: true)
  Future<chopper.Response<num>> _usersCountGet({
    @Header('Cache-Control') String? cacheControl,
  });
}

@JsonSerializable(explicitToJson: true)
class Error {
  const Error({this.data, required this.error});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  static const toJsonFactory = _$ErrorToJson;
  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final dynamic data;
  @JsonKey(name: 'error', includeIfNull: false)
  final Error$Error error;
  static const fromJsonFactory = _$ErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(error) ^
      runtimeType.hashCode;
}

extension $ErrorExtension on Error {
  Error copyWith({dynamic data, Error$Error? error}) {
    return Error(data: data ?? this.data, error: error ?? this.error);
  }

  Error copyWithWrapped({Wrapped<dynamic>? data, Wrapped<Error$Error>? error}) {
    return Error(
      data: (data != null ? data.value : this.data),
      error: (error != null ? error.value : this.error),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryRequest {
  const CategoryRequest({required this.data});

  factory CategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CategoryRequestFromJson(json);

  static const toJsonFactory = _$CategoryRequestToJson;
  Map<String, dynamic> toJson() => _$CategoryRequestToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final CategoryRequest$Data data;
  static const fromJsonFactory = _$CategoryRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryRequest &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $CategoryRequestExtension on CategoryRequest {
  CategoryRequest copyWith({CategoryRequest$Data? data}) {
    return CategoryRequest(data: data ?? this.data);
  }

  CategoryRequest copyWithWrapped({Wrapped<CategoryRequest$Data>? data}) {
    return CategoryRequest(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryListResponse {
  const CategoryListResponse({this.data, this.meta});

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);

  static const toJsonFactory = _$CategoryListResponseToJson;
  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final List<Category>? data;
  @JsonKey(name: 'meta', includeIfNull: false)
  final CategoryListResponse$Meta? meta;
  static const fromJsonFactory = _$CategoryListResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryListResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(meta) ^
      runtimeType.hashCode;
}

extension $CategoryListResponseExtension on CategoryListResponse {
  CategoryListResponse copyWith({
    List<Category>? data,
    CategoryListResponse$Meta? meta,
  }) {
    return CategoryListResponse(
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }

  CategoryListResponse copyWithWrapped({
    Wrapped<List<Category>?>? data,
    Wrapped<CategoryListResponse$Meta?>? meta,
  }) {
    return CategoryListResponse(
      data: (data != null ? data.value : this.data),
      meta: (meta != null ? meta.value : this.meta),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category {
  const Category({
    this.id,
    this.documentId,
    required this.title,
    this.slug,
    this.description,
    this.photo,
    this.itemCount,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  static const toJsonFactory = _$CategoryToJson;
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String title;
  @JsonKey(name: 'slug', includeIfNull: false, defaultValue: '')
  final String? slug;
  @JsonKey(name: 'description', includeIfNull: false)
  final dynamic description;
  @JsonKey(name: 'photo', includeIfNull: false)
  final Category$Photo? photo;
  @JsonKey(name: 'ItemCount', includeIfNull: false)
  final int? itemCount;
  @JsonKey(name: 'products', includeIfNull: false)
  final List<Category$Products$Item>? products;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Localizations$Item>? localizations;
  static const fromJsonFactory = _$CategoryFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.itemCount, itemCount) ||
                const DeepCollectionEquality().equals(
                  other.itemCount,
                  itemCount,
                )) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality().equals(
                  other.products,
                  products,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(itemCount) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $CategoryExtension on Category {
  Category copyWith({
    double? id,
    String? documentId,
    String? title,
    String? slug,
    dynamic description,
    Category$Photo? photo,
    int? itemCount,
    List<Category$Products$Item>? products,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$CreatedBy? createdBy,
    Category$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Localizations$Item>? localizations,
  }) {
    return Category(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      itemCount: itemCount ?? this.itemCount,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String>? title,
    Wrapped<String?>? slug,
    Wrapped<dynamic>? description,
    Wrapped<Category$Photo?>? photo,
    Wrapped<int?>? itemCount,
    Wrapped<List<Category$Products$Item>?>? products,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$CreatedBy?>? createdBy,
    Wrapped<Category$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Category$Localizations$Item>?>? localizations,
  }) {
    return Category(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      title: (title != null ? title.value : this.title),
      slug: (slug != null ? slug.value : this.slug),
      description: (description != null ? description.value : this.description),
      photo: (photo != null ? photo.value : this.photo),
      itemCount: (itemCount != null ? itemCount.value : this.itemCount),
      products: (products != null ? products.value : this.products),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryResponse {
  const CategoryResponse({this.data, this.meta});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  static const toJsonFactory = _$CategoryResponseToJson;
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final Category? data;
  @JsonKey(name: 'meta', includeIfNull: false)
  final Object? meta;
  static const fromJsonFactory = _$CategoryResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(meta) ^
      runtimeType.hashCode;
}

extension $CategoryResponseExtension on CategoryResponse {
  CategoryResponse copyWith({Category? data, Object? meta}) {
    return CategoryResponse(data: data ?? this.data, meta: meta ?? this.meta);
  }

  CategoryResponse copyWithWrapped({
    Wrapped<Category?>? data,
    Wrapped<Object?>? meta,
  }) {
    return CategoryResponse(
      data: (data != null ? data.value : this.data),
      meta: (meta != null ? meta.value : this.meta),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ProductRequest {
  const ProductRequest({required this.data});

  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);

  static const toJsonFactory = _$ProductRequestToJson;
  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final ProductRequest$Data data;
  static const fromJsonFactory = _$ProductRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductRequest &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^ runtimeType.hashCode;
}

extension $ProductRequestExtension on ProductRequest {
  ProductRequest copyWith({ProductRequest$Data? data}) {
    return ProductRequest(data: data ?? this.data);
  }

  ProductRequest copyWithWrapped({Wrapped<ProductRequest$Data>? data}) {
    return ProductRequest(data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class ProductListResponse {
  const ProductListResponse({this.data, this.meta});

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);

  static const toJsonFactory = _$ProductListResponseToJson;
  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);

  @JsonKey(name: 'data', includeIfNull: false, defaultValue: <Product>[])
  final List<Product>? data;
  @JsonKey(name: 'meta', includeIfNull: false)
  final ProductListResponse$Meta? meta;
  static const fromJsonFactory = _$ProductListResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductListResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(meta) ^
      runtimeType.hashCode;
}

extension $ProductListResponseExtension on ProductListResponse {
  ProductListResponse copyWith({
    List<Product>? data,
    ProductListResponse$Meta? meta,
  }) {
    return ProductListResponse(
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }

  ProductListResponse copyWithWrapped({
    Wrapped<List<Product>?>? data,
    Wrapped<ProductListResponse$Meta?>? meta,
  }) {
    return ProductListResponse(
      data: (data != null ? data.value : this.data),
      meta: (meta != null ? meta.value : this.meta),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product {
  const Product({
    this.id,
    this.documentId,
    required this.name,
    this.slug,
    required this.price,
    this.photo,
    this.description,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  static const toJsonFactory = _$ProductToJson;
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String name;
  @JsonKey(name: 'slug', includeIfNull: false, defaultValue: '')
  final String? slug;
  @JsonKey(name: 'price', includeIfNull: false)
  final double price;
  @JsonKey(name: 'photo', includeIfNull: false)
  final List<Product$Photo$Item>? photo;
  @JsonKey(name: 'description', includeIfNull: false)
  final dynamic description;
  @JsonKey(name: 'category', includeIfNull: false)
  final Product$Category? category;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Localizations$Item>? localizations;
  static const fromJsonFactory = _$ProductFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality().equals(
                  other.category,
                  category,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $ProductExtension on Product {
  Product copyWith({
    double? id,
    String? documentId,
    String? name,
    String? slug,
    double? price,
    List<Product$Photo$Item>? photo,
    dynamic description,
    Product$Category? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$CreatedBy? createdBy,
    Product$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Localizations$Item>? localizations,
  }) {
    return Product(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      photo: photo ?? this.photo,
      description: description ?? this.description,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String>? name,
    Wrapped<String?>? slug,
    Wrapped<double>? price,
    Wrapped<List<Product$Photo$Item>?>? photo,
    Wrapped<dynamic>? description,
    Wrapped<Product$Category?>? category,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$CreatedBy?>? createdBy,
    Wrapped<Product$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Product$Localizations$Item>?>? localizations,
  }) {
    return Product(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      slug: (slug != null ? slug.value : this.slug),
      price: (price != null ? price.value : this.price),
      photo: (photo != null ? photo.value : this.photo),
      description: (description != null ? description.value : this.description),
      category: (category != null ? category.value : this.category),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ProductResponse {
  const ProductResponse({this.data, this.meta});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  static const toJsonFactory = _$ProductResponseToJson;
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final Product? data;
  @JsonKey(name: 'meta', includeIfNull: false)
  final Object? meta;
  static const fromJsonFactory = _$ProductResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(meta) ^
      runtimeType.hashCode;
}

extension $ProductResponseExtension on ProductResponse {
  ProductResponse copyWith({Product? data, Object? meta}) {
    return ProductResponse(data: data ?? this.data, meta: meta ?? this.meta);
  }

  ProductResponse copyWithWrapped({
    Wrapped<Product?>? data,
    Wrapped<Object?>? meta,
  }) {
    return ProductResponse(
      data: (data != null ? data.value : this.data),
      meta: (meta != null ? meta.value : this.meta),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UploadFile {
  const UploadFile({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  factory UploadFile.fromJson(Map<String, dynamic> json) =>
      _$UploadFileFromJson(json);

  static const toJsonFactory = _$UploadFileToJson;
  Map<String, dynamic> toJson() => _$UploadFileToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final double? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final double? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final double? formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final Object? providerMetadata;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  static const fromJsonFactory = _$UploadFileFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UploadFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      runtimeType.hashCode;
}

extension $UploadFileExtension on UploadFile {
  UploadFile copyWith({
    double? id,
    String? name,
    String? alternativeText,
    String? caption,
    double? width,
    double? height,
    double? formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    Object? providerMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UploadFile(
      id: id ?? this.id,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  UploadFile copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<double?>? width,
    Wrapped<double?>? height,
    Wrapped<double?>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<Object?>? providerMetadata,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
  }) {
    return UploadFile(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsRole {
  const UsersPermissionsRole({
    this.id,
    this.name,
    this.description,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory UsersPermissionsRole.fromJson(Map<String, dynamic> json) =>
      _$UsersPermissionsRoleFromJson(json);

  static const toJsonFactory = _$UsersPermissionsRoleToJson;
  Map<String, dynamic> toJson() => _$UsersPermissionsRoleToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  static const fromJsonFactory = _$UsersPermissionsRoleFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsRole &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      runtimeType.hashCode;
}

extension $UsersPermissionsRoleExtension on UsersPermissionsRole {
  UsersPermissionsRole copyWith({
    double? id,
    String? name,
    String? description,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UsersPermissionsRole(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  UsersPermissionsRole copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? name,
    Wrapped<String?>? description,
    Wrapped<String?>? type,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
  }) {
    return UsersPermissionsRole(
      id: (id != null ? id.value : this.id),
      name: (name != null ? name.value : this.name),
      description: (description != null ? description.value : this.description),
      type: (type != null ? type.value : this.type),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsUser {
  const UsersPermissionsUser({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
  });

  factory UsersPermissionsUser.fromJson(Map<String, dynamic> json) =>
      _$UsersPermissionsUserFromJson(json);

  static const toJsonFactory = _$UsersPermissionsUserToJson;
  Map<String, dynamic> toJson() => _$UsersPermissionsUserToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'confirmed', includeIfNull: false)
  final bool? confirmed;
  @JsonKey(name: 'blocked', includeIfNull: false)
  final bool? blocked;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  static const fromJsonFactory = _$UsersPermissionsUserFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality().equals(
                  other.confirmed,
                  confirmed,
                )) &&
            (identical(other.blocked, blocked) ||
                const DeepCollectionEquality().equals(
                  other.blocked,
                  blocked,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(blocked) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      runtimeType.hashCode;
}

extension $UsersPermissionsUserExtension on UsersPermissionsUser {
  UsersPermissionsUser copyWith({
    double? id,
    String? username,
    String? email,
    String? provider,
    bool? confirmed,
    bool? blocked,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UsersPermissionsUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      provider: provider ?? this.provider,
      confirmed: confirmed ?? this.confirmed,
      blocked: blocked ?? this.blocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  UsersPermissionsUser copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? username,
    Wrapped<String?>? email,
    Wrapped<String?>? provider,
    Wrapped<bool?>? confirmed,
    Wrapped<bool?>? blocked,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
  }) {
    return UsersPermissionsUser(
      id: (id != null ? id.value : this.id),
      username: (username != null ? username.value : this.username),
      email: (email != null ? email.value : this.email),
      provider: (provider != null ? provider.value : this.provider),
      confirmed: (confirmed != null ? confirmed.value : this.confirmed),
      blocked: (blocked != null ? blocked.value : this.blocked),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsUserRegistration {
  const UsersPermissionsUserRegistration({this.jwt, this.user});

  factory UsersPermissionsUserRegistration.fromJson(
    Map<String, dynamic> json,
  ) => _$UsersPermissionsUserRegistrationFromJson(json);

  static const toJsonFactory = _$UsersPermissionsUserRegistrationToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsUserRegistrationToJson(this);

  @JsonKey(name: 'jwt', includeIfNull: false, defaultValue: '')
  final String? jwt;
  @JsonKey(name: 'user', includeIfNull: false)
  final UsersPermissionsUser? user;
  static const fromJsonFactory = _$UsersPermissionsUserRegistrationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsUserRegistration &&
            (identical(other.jwt, jwt) ||
                const DeepCollectionEquality().equals(other.jwt, jwt)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(jwt) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $UsersPermissionsUserRegistrationExtension
    on UsersPermissionsUserRegistration {
  UsersPermissionsUserRegistration copyWith({
    String? jwt,
    UsersPermissionsUser? user,
  }) {
    return UsersPermissionsUserRegistration(
      jwt: jwt ?? this.jwt,
      user: user ?? this.user,
    );
  }

  UsersPermissionsUserRegistration copyWithWrapped({
    Wrapped<String?>? jwt,
    Wrapped<UsersPermissionsUser?>? user,
  }) {
    return UsersPermissionsUserRegistration(
      jwt: (jwt != null ? jwt.value : this.jwt),
      user: (user != null ? user.value : this.user),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsPermissionsTree {
  const UsersPermissionsPermissionsTree();

  factory UsersPermissionsPermissionsTree.fromJson(Map<String, dynamic> json) =>
      _$UsersPermissionsPermissionsTreeFromJson(json);

  static const toJsonFactory = _$UsersPermissionsPermissionsTreeToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsPermissionsTreeToJson(this);

  static const fromJsonFactory = _$UsersPermissionsPermissionsTreeFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsRoleRequest$RequestBody {
  const UsersPermissionsRoleRequest$RequestBody({
    this.name,
    this.description,
    this.type,
    this.permissions,
  });

  factory UsersPermissionsRoleRequest$RequestBody.fromJson(
    Map<String, dynamic> json,
  ) => _$UsersPermissionsRoleRequest$RequestBodyFromJson(json);

  static const toJsonFactory = _$UsersPermissionsRoleRequest$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsRoleRequest$RequestBodyToJson(this);

  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'type', includeIfNull: false, defaultValue: '')
  final String? type;
  @JsonKey(name: 'permissions', includeIfNull: false)
  final UsersPermissionsPermissionsTree? permissions;
  static const fromJsonFactory =
      _$UsersPermissionsRoleRequest$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsRoleRequest$RequestBody &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.permissions, permissions) ||
                const DeepCollectionEquality().equals(
                  other.permissions,
                  permissions,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(permissions) ^
      runtimeType.hashCode;
}

extension $UsersPermissionsRoleRequest$RequestBodyExtension
    on UsersPermissionsRoleRequest$RequestBody {
  UsersPermissionsRoleRequest$RequestBody copyWith({
    String? name,
    String? description,
    String? type,
    UsersPermissionsPermissionsTree? permissions,
  }) {
    return UsersPermissionsRoleRequest$RequestBody(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      permissions: permissions ?? this.permissions,
    );
  }

  UsersPermissionsRoleRequest$RequestBody copyWithWrapped({
    Wrapped<String?>? name,
    Wrapped<String?>? description,
    Wrapped<String?>? type,
    Wrapped<UsersPermissionsPermissionsTree?>? permissions,
  }) {
    return UsersPermissionsRoleRequest$RequestBody(
      name: (name != null ? name.value : this.name),
      description: (description != null ? description.value : this.description),
      type: (type != null ? type.value : this.type),
      permissions: (permissions != null ? permissions.value : this.permissions),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UploadPost$RequestBody {
  const UploadPost$RequestBody({
    this.path,
    this.refId,
    this.ref,
    this.field,
    required this.files,
  });

  factory UploadPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$UploadPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$UploadPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$UploadPost$RequestBodyToJson(this);

  @JsonKey(name: 'path', includeIfNull: false, defaultValue: '')
  final String? path;
  @JsonKey(name: 'refId', includeIfNull: false, defaultValue: '')
  final String? refId;
  @JsonKey(name: 'ref', includeIfNull: false, defaultValue: '')
  final String? ref;
  @JsonKey(name: 'field', includeIfNull: false, defaultValue: '')
  final String? field;
  @JsonKey(name: 'files', includeIfNull: false, defaultValue: <String>[])
  final List<String> files;
  static const fromJsonFactory = _$UploadPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UploadPost$RequestBody &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.refId, refId) ||
                const DeepCollectionEquality().equals(other.refId, refId)) &&
            (identical(other.ref, ref) ||
                const DeepCollectionEquality().equals(other.ref, ref)) &&
            (identical(other.field, field) ||
                const DeepCollectionEquality().equals(other.field, field)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(refId) ^
      const DeepCollectionEquality().hash(ref) ^
      const DeepCollectionEquality().hash(field) ^
      const DeepCollectionEquality().hash(files) ^
      runtimeType.hashCode;
}

extension $UploadPost$RequestBodyExtension on UploadPost$RequestBody {
  UploadPost$RequestBody copyWith({
    String? path,
    String? refId,
    String? ref,
    String? field,
    List<String>? files,
  }) {
    return UploadPost$RequestBody(
      path: path ?? this.path,
      refId: refId ?? this.refId,
      ref: ref ?? this.ref,
      field: field ?? this.field,
      files: files ?? this.files,
    );
  }

  UploadPost$RequestBody copyWithWrapped({
    Wrapped<String?>? path,
    Wrapped<String?>? refId,
    Wrapped<String?>? ref,
    Wrapped<String?>? field,
    Wrapped<List<String>>? files,
  }) {
    return UploadPost$RequestBody(
      path: (path != null ? path.value : this.path),
      refId: (refId != null ? refId.value : this.refId),
      ref: (ref != null ? ref.value : this.ref),
      field: (field != null ? field.value : this.field),
      files: (files != null ? files.value : this.files),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UploadIdIdPost$RequestBody {
  const UploadIdIdPost$RequestBody({this.fileInfo, this.files});

  factory UploadIdIdPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$UploadIdIdPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$UploadIdIdPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$UploadIdIdPost$RequestBodyToJson(this);

  @JsonKey(name: 'fileInfo', includeIfNull: false)
  final UploadIdIdPost$RequestBody$FileInfo? fileInfo;
  @JsonKey(name: 'files', includeIfNull: false, defaultValue: '')
  final String? files;
  static const fromJsonFactory = _$UploadIdIdPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UploadIdIdPost$RequestBody &&
            (identical(other.fileInfo, fileInfo) ||
                const DeepCollectionEquality().equals(
                  other.fileInfo,
                  fileInfo,
                )) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fileInfo) ^
      const DeepCollectionEquality().hash(files) ^
      runtimeType.hashCode;
}

extension $UploadIdIdPost$RequestBodyExtension on UploadIdIdPost$RequestBody {
  UploadIdIdPost$RequestBody copyWith({
    UploadIdIdPost$RequestBody$FileInfo? fileInfo,
    String? files,
  }) {
    return UploadIdIdPost$RequestBody(
      fileInfo: fileInfo ?? this.fileInfo,
      files: files ?? this.files,
    );
  }

  UploadIdIdPost$RequestBody copyWithWrapped({
    Wrapped<UploadIdIdPost$RequestBody$FileInfo?>? fileInfo,
    Wrapped<String?>? files,
  }) {
    return UploadIdIdPost$RequestBody(
      fileInfo: (fileInfo != null ? fileInfo.value : this.fileInfo),
      files: (files != null ? files.value : this.files),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AuthLocalPost$RequestBody {
  const AuthLocalPost$RequestBody({this.identifier, this.password});

  factory AuthLocalPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$AuthLocalPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$AuthLocalPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$AuthLocalPost$RequestBodyToJson(this);

  @JsonKey(name: 'identifier', includeIfNull: false, defaultValue: '')
  final String? identifier;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String? password;
  static const fromJsonFactory = _$AuthLocalPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthLocalPost$RequestBody &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality().equals(
                  other.identifier,
                  identifier,
                )) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $AuthLocalPost$RequestBodyExtension on AuthLocalPost$RequestBody {
  AuthLocalPost$RequestBody copyWith({String? identifier, String? password}) {
    return AuthLocalPost$RequestBody(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
    );
  }

  AuthLocalPost$RequestBody copyWithWrapped({
    Wrapped<String?>? identifier,
    Wrapped<String?>? password,
  }) {
    return AuthLocalPost$RequestBody(
      identifier: (identifier != null ? identifier.value : this.identifier),
      password: (password != null ? password.value : this.password),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AuthLocalRegisterPost$RequestBody {
  const AuthLocalRegisterPost$RequestBody({
    this.username,
    this.email,
    this.password,
  });

  factory AuthLocalRegisterPost$RequestBody.fromJson(
    Map<String, dynamic> json,
  ) => _$AuthLocalRegisterPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$AuthLocalRegisterPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$AuthLocalRegisterPost$RequestBodyToJson(this);

  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String? password;
  static const fromJsonFactory = _$AuthLocalRegisterPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthLocalRegisterPost$RequestBody &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $AuthLocalRegisterPost$RequestBodyExtension
    on AuthLocalRegisterPost$RequestBody {
  AuthLocalRegisterPost$RequestBody copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return AuthLocalRegisterPost$RequestBody(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  AuthLocalRegisterPost$RequestBody copyWithWrapped({
    Wrapped<String?>? username,
    Wrapped<String?>? email,
    Wrapped<String?>? password,
  }) {
    return AuthLocalRegisterPost$RequestBody(
      username: (username != null ? username.value : this.username),
      email: (email != null ? email.value : this.email),
      password: (password != null ? password.value : this.password),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AuthForgotPasswordPost$RequestBody {
  const AuthForgotPasswordPost$RequestBody({this.email});

  factory AuthForgotPasswordPost$RequestBody.fromJson(
    Map<String, dynamic> json,
  ) => _$AuthForgotPasswordPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$AuthForgotPasswordPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$AuthForgotPasswordPost$RequestBodyToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  static const fromJsonFactory = _$AuthForgotPasswordPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthForgotPasswordPost$RequestBody &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $AuthForgotPasswordPost$RequestBodyExtension
    on AuthForgotPasswordPost$RequestBody {
  AuthForgotPasswordPost$RequestBody copyWith({String? email}) {
    return AuthForgotPasswordPost$RequestBody(email: email ?? this.email);
  }

  AuthForgotPasswordPost$RequestBody copyWithWrapped({
    Wrapped<String?>? email,
  }) {
    return AuthForgotPasswordPost$RequestBody(
      email: (email != null ? email.value : this.email),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AuthResetPasswordPost$RequestBody {
  const AuthResetPasswordPost$RequestBody({
    this.password,
    this.passwordConfirmation,
    this.code,
  });

  factory AuthResetPasswordPost$RequestBody.fromJson(
    Map<String, dynamic> json,
  ) => _$AuthResetPasswordPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$AuthResetPasswordPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$AuthResetPasswordPost$RequestBodyToJson(this);

  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String? password;
  @JsonKey(name: 'passwordConfirmation', includeIfNull: false, defaultValue: '')
  final String? passwordConfirmation;
  @JsonKey(name: 'code', includeIfNull: false, defaultValue: '')
  final String? code;
  static const fromJsonFactory = _$AuthResetPasswordPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthResetPasswordPost$RequestBody &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                const DeepCollectionEquality().equals(
                  other.passwordConfirmation,
                  passwordConfirmation,
                )) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(passwordConfirmation) ^
      const DeepCollectionEquality().hash(code) ^
      runtimeType.hashCode;
}

extension $AuthResetPasswordPost$RequestBodyExtension
    on AuthResetPasswordPost$RequestBody {
  AuthResetPasswordPost$RequestBody copyWith({
    String? password,
    String? passwordConfirmation,
    String? code,
  }) {
    return AuthResetPasswordPost$RequestBody(
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      code: code ?? this.code,
    );
  }

  AuthResetPasswordPost$RequestBody copyWithWrapped({
    Wrapped<String?>? password,
    Wrapped<String?>? passwordConfirmation,
    Wrapped<String?>? code,
  }) {
    return AuthResetPasswordPost$RequestBody(
      password: (password != null ? password.value : this.password),
      passwordConfirmation: (passwordConfirmation != null
          ? passwordConfirmation.value
          : this.passwordConfirmation),
      code: (code != null ? code.value : this.code),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AuthChangePasswordPost$RequestBody {
  const AuthChangePasswordPost$RequestBody({
    required this.password,
    required this.currentPassword,
    required this.passwordConfirmation,
  });

  factory AuthChangePasswordPost$RequestBody.fromJson(
    Map<String, dynamic> json,
  ) => _$AuthChangePasswordPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$AuthChangePasswordPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$AuthChangePasswordPost$RequestBodyToJson(this);

  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String password;
  @JsonKey(name: 'currentPassword', includeIfNull: false, defaultValue: '')
  final String currentPassword;
  @JsonKey(name: 'passwordConfirmation', includeIfNull: false, defaultValue: '')
  final String passwordConfirmation;
  static const fromJsonFactory = _$AuthChangePasswordPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthChangePasswordPost$RequestBody &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )) &&
            (identical(other.currentPassword, currentPassword) ||
                const DeepCollectionEquality().equals(
                  other.currentPassword,
                  currentPassword,
                )) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                const DeepCollectionEquality().equals(
                  other.passwordConfirmation,
                  passwordConfirmation,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(currentPassword) ^
      const DeepCollectionEquality().hash(passwordConfirmation) ^
      runtimeType.hashCode;
}

extension $AuthChangePasswordPost$RequestBodyExtension
    on AuthChangePasswordPost$RequestBody {
  AuthChangePasswordPost$RequestBody copyWith({
    String? password,
    String? currentPassword,
    String? passwordConfirmation,
  }) {
    return AuthChangePasswordPost$RequestBody(
      password: password ?? this.password,
      currentPassword: currentPassword ?? this.currentPassword,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
    );
  }

  AuthChangePasswordPost$RequestBody copyWithWrapped({
    Wrapped<String>? password,
    Wrapped<String>? currentPassword,
    Wrapped<String>? passwordConfirmation,
  }) {
    return AuthChangePasswordPost$RequestBody(
      password: (password != null ? password.value : this.password),
      currentPassword: (currentPassword != null
          ? currentPassword.value
          : this.currentPassword),
      passwordConfirmation: (passwordConfirmation != null
          ? passwordConfirmation.value
          : this.passwordConfirmation),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AuthSendEmailConfirmationPost$RequestBody {
  const AuthSendEmailConfirmationPost$RequestBody({this.email});

  factory AuthSendEmailConfirmationPost$RequestBody.fromJson(
    Map<String, dynamic> json,
  ) => _$AuthSendEmailConfirmationPost$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$AuthSendEmailConfirmationPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$AuthSendEmailConfirmationPost$RequestBodyToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  static const fromJsonFactory =
      _$AuthSendEmailConfirmationPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthSendEmailConfirmationPost$RequestBody &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $AuthSendEmailConfirmationPost$RequestBodyExtension
    on AuthSendEmailConfirmationPost$RequestBody {
  AuthSendEmailConfirmationPost$RequestBody copyWith({String? email}) {
    return AuthSendEmailConfirmationPost$RequestBody(
      email: email ?? this.email,
    );
  }

  AuthSendEmailConfirmationPost$RequestBody copyWithWrapped({
    Wrapped<String?>? email,
  }) {
    return AuthSendEmailConfirmationPost$RequestBody(
      email: (email != null ? email.value : this.email),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPost$RequestBody {
  const UsersPost$RequestBody({
    required this.email,
    required this.username,
    required this.password,
  });

  factory UsersPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$UsersPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$UsersPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$UsersPost$RequestBodyToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String email;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String username;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String password;
  static const fromJsonFactory = _$UsersPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPost$RequestBody &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $UsersPost$RequestBodyExtension on UsersPost$RequestBody {
  UsersPost$RequestBody copyWith({
    String? email,
    String? username,
    String? password,
  }) {
    return UsersPost$RequestBody(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  UsersPost$RequestBody copyWithWrapped({
    Wrapped<String>? email,
    Wrapped<String>? username,
    Wrapped<String>? password,
  }) {
    return UsersPost$RequestBody(
      email: (email != null ? email.value : this.email),
      username: (username != null ? username.value : this.username),
      password: (password != null ? password.value : this.password),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersIdPut$RequestBody {
  const UsersIdPut$RequestBody({
    required this.email,
    required this.username,
    required this.password,
  });

  factory UsersIdPut$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$UsersIdPut$RequestBodyFromJson(json);

  static const toJsonFactory = _$UsersIdPut$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$UsersIdPut$RequestBodyToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String email;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String username;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String password;
  static const fromJsonFactory = _$UsersIdPut$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersIdPut$RequestBody &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality().equals(
                  other.password,
                  password,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $UsersIdPut$RequestBodyExtension on UsersIdPut$RequestBody {
  UsersIdPut$RequestBody copyWith({
    String? email,
    String? username,
    String? password,
  }) {
    return UsersIdPut$RequestBody(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  UsersIdPut$RequestBody copyWithWrapped({
    Wrapped<String>? email,
    Wrapped<String>? username,
    Wrapped<String>? password,
  }) {
    return UsersIdPut$RequestBody(
      email: (email != null ? email.value : this.email),
      username: (username != null ? username.value : this.username),
      password: (password != null ? password.value : this.password),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AuthForgotPasswordPost$Response {
  const AuthForgotPasswordPost$Response({this.ok});

  factory AuthForgotPasswordPost$Response.fromJson(Map<String, dynamic> json) =>
      _$AuthForgotPasswordPost$ResponseFromJson(json);

  static const toJsonFactory = _$AuthForgotPasswordPost$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$AuthForgotPasswordPost$ResponseToJson(this);

  @JsonKey(
    name: 'ok',
    includeIfNull: false,
    toJson: authForgotPasswordPost$ResponseOkNullableToJson,
    fromJson: authForgotPasswordPost$ResponseOkNullableFromJson,
  )
  final enums.AuthForgotPasswordPost$ResponseOk? ok;
  static const fromJsonFactory = _$AuthForgotPasswordPost$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthForgotPasswordPost$Response &&
            (identical(other.ok, ok) ||
                const DeepCollectionEquality().equals(other.ok, ok)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(ok) ^ runtimeType.hashCode;
}

extension $AuthForgotPasswordPost$ResponseExtension
    on AuthForgotPasswordPost$Response {
  AuthForgotPasswordPost$Response copyWith({
    enums.AuthForgotPasswordPost$ResponseOk? ok,
  }) {
    return AuthForgotPasswordPost$Response(ok: ok ?? this.ok);
  }

  AuthForgotPasswordPost$Response copyWithWrapped({
    Wrapped<enums.AuthForgotPasswordPost$ResponseOk?>? ok,
  }) {
    return AuthForgotPasswordPost$Response(
      ok: (ok != null ? ok.value : this.ok),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class AuthSendEmailConfirmationPost$Response {
  const AuthSendEmailConfirmationPost$Response({this.email, this.sent});

  factory AuthSendEmailConfirmationPost$Response.fromJson(
    Map<String, dynamic> json,
  ) => _$AuthSendEmailConfirmationPost$ResponseFromJson(json);

  static const toJsonFactory = _$AuthSendEmailConfirmationPost$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$AuthSendEmailConfirmationPost$ResponseToJson(this);

  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(
    name: 'sent',
    includeIfNull: false,
    toJson: authSendEmailConfirmationPost$ResponseSentNullableToJson,
    fromJson: authSendEmailConfirmationPost$ResponseSentNullableFromJson,
  )
  final enums.AuthSendEmailConfirmationPost$ResponseSent? sent;
  static const fromJsonFactory =
      _$AuthSendEmailConfirmationPost$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AuthSendEmailConfirmationPost$Response &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.sent, sent) ||
                const DeepCollectionEquality().equals(other.sent, sent)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(sent) ^
      runtimeType.hashCode;
}

extension $AuthSendEmailConfirmationPost$ResponseExtension
    on AuthSendEmailConfirmationPost$Response {
  AuthSendEmailConfirmationPost$Response copyWith({
    String? email,
    enums.AuthSendEmailConfirmationPost$ResponseSent? sent,
  }) {
    return AuthSendEmailConfirmationPost$Response(
      email: email ?? this.email,
      sent: sent ?? this.sent,
    );
  }

  AuthSendEmailConfirmationPost$Response copyWithWrapped({
    Wrapped<String?>? email,
    Wrapped<enums.AuthSendEmailConfirmationPost$ResponseSent?>? sent,
  }) {
    return AuthSendEmailConfirmationPost$Response(
      email: (email != null ? email.value : this.email),
      sent: (sent != null ? sent.value : this.sent),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsPermissionsGet$Response {
  const UsersPermissionsPermissionsGet$Response({this.permissions});

  factory UsersPermissionsPermissionsGet$Response.fromJson(
    Map<String, dynamic> json,
  ) => _$UsersPermissionsPermissionsGet$ResponseFromJson(json);

  static const toJsonFactory = _$UsersPermissionsPermissionsGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsPermissionsGet$ResponseToJson(this);

  @JsonKey(name: 'permissions', includeIfNull: false)
  final UsersPermissionsPermissionsTree? permissions;
  static const fromJsonFactory =
      _$UsersPermissionsPermissionsGet$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsPermissionsGet$Response &&
            (identical(other.permissions, permissions) ||
                const DeepCollectionEquality().equals(
                  other.permissions,
                  permissions,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(permissions) ^ runtimeType.hashCode;
}

extension $UsersPermissionsPermissionsGet$ResponseExtension
    on UsersPermissionsPermissionsGet$Response {
  UsersPermissionsPermissionsGet$Response copyWith({
    UsersPermissionsPermissionsTree? permissions,
  }) {
    return UsersPermissionsPermissionsGet$Response(
      permissions: permissions ?? this.permissions,
    );
  }

  UsersPermissionsPermissionsGet$Response copyWithWrapped({
    Wrapped<UsersPermissionsPermissionsTree?>? permissions,
  }) {
    return UsersPermissionsPermissionsGet$Response(
      permissions: (permissions != null ? permissions.value : this.permissions),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsRolesGet$Response {
  const UsersPermissionsRolesGet$Response({this.roles});

  factory UsersPermissionsRolesGet$Response.fromJson(
    Map<String, dynamic> json,
  ) => _$UsersPermissionsRolesGet$ResponseFromJson(json);

  static const toJsonFactory = _$UsersPermissionsRolesGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsRolesGet$ResponseToJson(this);

  @JsonKey(name: 'roles', includeIfNull: false, defaultValue: <Object>[])
  final List<Object>? roles;
  static const fromJsonFactory = _$UsersPermissionsRolesGet$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsRolesGet$Response &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(roles) ^ runtimeType.hashCode;
}

extension $UsersPermissionsRolesGet$ResponseExtension
    on UsersPermissionsRolesGet$Response {
  UsersPermissionsRolesGet$Response copyWith({List<Object>? roles}) {
    return UsersPermissionsRolesGet$Response(roles: roles ?? this.roles);
  }

  UsersPermissionsRolesGet$Response copyWithWrapped({
    Wrapped<List<Object>?>? roles,
  }) {
    return UsersPermissionsRolesGet$Response(
      roles: (roles != null ? roles.value : this.roles),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsRolesPost$Response {
  const UsersPermissionsRolesPost$Response({this.ok});

  factory UsersPermissionsRolesPost$Response.fromJson(
    Map<String, dynamic> json,
  ) => _$UsersPermissionsRolesPost$ResponseFromJson(json);

  static const toJsonFactory = _$UsersPermissionsRolesPost$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsRolesPost$ResponseToJson(this);

  @JsonKey(
    name: 'ok',
    includeIfNull: false,
    toJson: usersPermissionsRolesPost$ResponseOkNullableToJson,
    fromJson: usersPermissionsRolesPost$ResponseOkNullableFromJson,
  )
  final enums.UsersPermissionsRolesPost$ResponseOk? ok;
  static const fromJsonFactory = _$UsersPermissionsRolesPost$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsRolesPost$Response &&
            (identical(other.ok, ok) ||
                const DeepCollectionEquality().equals(other.ok, ok)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(ok) ^ runtimeType.hashCode;
}

extension $UsersPermissionsRolesPost$ResponseExtension
    on UsersPermissionsRolesPost$Response {
  UsersPermissionsRolesPost$Response copyWith({
    enums.UsersPermissionsRolesPost$ResponseOk? ok,
  }) {
    return UsersPermissionsRolesPost$Response(ok: ok ?? this.ok);
  }

  UsersPermissionsRolesPost$Response copyWithWrapped({
    Wrapped<enums.UsersPermissionsRolesPost$ResponseOk?>? ok,
  }) {
    return UsersPermissionsRolesPost$Response(
      ok: (ok != null ? ok.value : this.ok),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsRolesIdGet$Response {
  const UsersPermissionsRolesIdGet$Response({this.role});

  factory UsersPermissionsRolesIdGet$Response.fromJson(
    Map<String, dynamic> json,
  ) => _$UsersPermissionsRolesIdGet$ResponseFromJson(json);

  static const toJsonFactory = _$UsersPermissionsRolesIdGet$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsRolesIdGet$ResponseToJson(this);

  @JsonKey(name: 'role', includeIfNull: false)
  final UsersPermissionsRole? role;
  static const fromJsonFactory = _$UsersPermissionsRolesIdGet$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsRolesIdGet$Response &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(role) ^ runtimeType.hashCode;
}

extension $UsersPermissionsRolesIdGet$ResponseExtension
    on UsersPermissionsRolesIdGet$Response {
  UsersPermissionsRolesIdGet$Response copyWith({UsersPermissionsRole? role}) {
    return UsersPermissionsRolesIdGet$Response(role: role ?? this.role);
  }

  UsersPermissionsRolesIdGet$Response copyWithWrapped({
    Wrapped<UsersPermissionsRole?>? role,
  }) {
    return UsersPermissionsRolesIdGet$Response(
      role: (role != null ? role.value : this.role),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsRolesRolePut$Response {
  const UsersPermissionsRolesRolePut$Response({this.ok});

  factory UsersPermissionsRolesRolePut$Response.fromJson(
    Map<String, dynamic> json,
  ) => _$UsersPermissionsRolesRolePut$ResponseFromJson(json);

  static const toJsonFactory = _$UsersPermissionsRolesRolePut$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsRolesRolePut$ResponseToJson(this);

  @JsonKey(
    name: 'ok',
    includeIfNull: false,
    toJson: usersPermissionsRolesRolePut$ResponseOkNullableToJson,
    fromJson: usersPermissionsRolesRolePut$ResponseOkNullableFromJson,
  )
  final enums.UsersPermissionsRolesRolePut$ResponseOk? ok;
  static const fromJsonFactory =
      _$UsersPermissionsRolesRolePut$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsRolesRolePut$Response &&
            (identical(other.ok, ok) ||
                const DeepCollectionEquality().equals(other.ok, ok)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(ok) ^ runtimeType.hashCode;
}

extension $UsersPermissionsRolesRolePut$ResponseExtension
    on UsersPermissionsRolesRolePut$Response {
  UsersPermissionsRolesRolePut$Response copyWith({
    enums.UsersPermissionsRolesRolePut$ResponseOk? ok,
  }) {
    return UsersPermissionsRolesRolePut$Response(ok: ok ?? this.ok);
  }

  UsersPermissionsRolesRolePut$Response copyWithWrapped({
    Wrapped<enums.UsersPermissionsRolesRolePut$ResponseOk?>? ok,
  }) {
    return UsersPermissionsRolesRolePut$Response(
      ok: (ok != null ? ok.value : this.ok),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UsersPermissionsRolesRoleDelete$Response {
  const UsersPermissionsRolesRoleDelete$Response({this.ok});

  factory UsersPermissionsRolesRoleDelete$Response.fromJson(
    Map<String, dynamic> json,
  ) => _$UsersPermissionsRolesRoleDelete$ResponseFromJson(json);

  static const toJsonFactory = _$UsersPermissionsRolesRoleDelete$ResponseToJson;
  Map<String, dynamic> toJson() =>
      _$UsersPermissionsRolesRoleDelete$ResponseToJson(this);

  @JsonKey(
    name: 'ok',
    includeIfNull: false,
    toJson: usersPermissionsRolesRoleDelete$ResponseOkNullableToJson,
    fromJson: usersPermissionsRolesRoleDelete$ResponseOkNullableFromJson,
  )
  final enums.UsersPermissionsRolesRoleDelete$ResponseOk? ok;
  static const fromJsonFactory =
      _$UsersPermissionsRolesRoleDelete$ResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UsersPermissionsRolesRoleDelete$Response &&
            (identical(other.ok, ok) ||
                const DeepCollectionEquality().equals(other.ok, ok)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(ok) ^ runtimeType.hashCode;
}

extension $UsersPermissionsRolesRoleDelete$ResponseExtension
    on UsersPermissionsRolesRoleDelete$Response {
  UsersPermissionsRolesRoleDelete$Response copyWith({
    enums.UsersPermissionsRolesRoleDelete$ResponseOk? ok,
  }) {
    return UsersPermissionsRolesRoleDelete$Response(ok: ok ?? this.ok);
  }

  UsersPermissionsRolesRoleDelete$Response copyWithWrapped({
    Wrapped<enums.UsersPermissionsRolesRoleDelete$ResponseOk?>? ok,
  }) {
    return UsersPermissionsRolesRoleDelete$Response(
      ok: (ok != null ? ok.value : this.ok),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Error$Error {
  const Error$Error({this.status, this.name, this.message, this.details});

  factory Error$Error.fromJson(Map<String, dynamic> json) =>
      _$Error$ErrorFromJson(json);

  static const toJsonFactory = _$Error$ErrorToJson;
  Map<String, dynamic> toJson() => _$Error$ErrorToJson(this);

  @JsonKey(name: 'status', includeIfNull: false)
  final int? status;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'message', includeIfNull: false, defaultValue: '')
  final String? message;
  @JsonKey(name: 'details', includeIfNull: false)
  final Object? details;
  static const fromJsonFactory = _$Error$ErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Error$Error &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(
                  other.message,
                  message,
                )) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $Error$ErrorExtension on Error$Error {
  Error$Error copyWith({
    int? status,
    String? name,
    String? message,
    Object? details,
  }) {
    return Error$Error(
      status: status ?? this.status,
      name: name ?? this.name,
      message: message ?? this.message,
      details: details ?? this.details,
    );
  }

  Error$Error copyWithWrapped({
    Wrapped<int?>? status,
    Wrapped<String?>? name,
    Wrapped<String?>? message,
    Wrapped<Object?>? details,
  }) {
    return Error$Error(
      status: (status != null ? status.value : this.status),
      name: (name != null ? name.value : this.name),
      message: (message != null ? message.value : this.message),
      details: (details != null ? details.value : this.details),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryRequest$Data {
  const CategoryRequest$Data({
    required this.title,
    this.slug,
    this.description,
    this.photo,
    this.itemCount,
    this.products,
    this.locale,
    this.localizations,
  });

  factory CategoryRequest$Data.fromJson(Map<String, dynamic> json) =>
      _$CategoryRequest$DataFromJson(json);

  static const toJsonFactory = _$CategoryRequest$DataToJson;
  Map<String, dynamic> toJson() => _$CategoryRequest$DataToJson(this);

  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String title;
  @JsonKey(name: 'slug', includeIfNull: false, defaultValue: '')
  final String? slug;
  @JsonKey(name: 'description', includeIfNull: false)
  final dynamic description;
  @JsonKey(name: 'photo', includeIfNull: false)
  final dynamic photo;
  @JsonKey(name: 'ItemCount', includeIfNull: false)
  final int? itemCount;
  @JsonKey(name: 'products', includeIfNull: false)
  final List<Object>? products;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Object>? localizations;
  static const fromJsonFactory = _$CategoryRequest$DataFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryRequest$Data &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.itemCount, itemCount) ||
                const DeepCollectionEquality().equals(
                  other.itemCount,
                  itemCount,
                )) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality().equals(
                  other.products,
                  products,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(itemCount) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $CategoryRequest$DataExtension on CategoryRequest$Data {
  CategoryRequest$Data copyWith({
    String? title,
    String? slug,
    dynamic description,
    dynamic photo,
    int? itemCount,
    List<Object>? products,
    String? locale,
    List<Object>? localizations,
  }) {
    return CategoryRequest$Data(
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      itemCount: itemCount ?? this.itemCount,
      products: products ?? this.products,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  CategoryRequest$Data copyWithWrapped({
    Wrapped<String>? title,
    Wrapped<String?>? slug,
    Wrapped<dynamic>? description,
    Wrapped<dynamic>? photo,
    Wrapped<int?>? itemCount,
    Wrapped<List<Object>?>? products,
    Wrapped<String?>? locale,
    Wrapped<List<Object>?>? localizations,
  }) {
    return CategoryRequest$Data(
      title: (title != null ? title.value : this.title),
      slug: (slug != null ? slug.value : this.slug),
      description: (description != null ? description.value : this.description),
      photo: (photo != null ? photo.value : this.photo),
      itemCount: (itemCount != null ? itemCount.value : this.itemCount),
      products: (products != null ? products.value : this.products),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryListResponse$Meta {
  const CategoryListResponse$Meta({this.pagination});

  factory CategoryListResponse$Meta.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponse$MetaFromJson(json);

  static const toJsonFactory = _$CategoryListResponse$MetaToJson;
  Map<String, dynamic> toJson() => _$CategoryListResponse$MetaToJson(this);

  @JsonKey(name: 'pagination', includeIfNull: false)
  final CategoryListResponse$Meta$Pagination? pagination;
  static const fromJsonFactory = _$CategoryListResponse$MetaFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryListResponse$Meta &&
            (identical(other.pagination, pagination) ||
                const DeepCollectionEquality().equals(
                  other.pagination,
                  pagination,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(pagination) ^ runtimeType.hashCode;
}

extension $CategoryListResponse$MetaExtension on CategoryListResponse$Meta {
  CategoryListResponse$Meta copyWith({
    CategoryListResponse$Meta$Pagination? pagination,
  }) {
    return CategoryListResponse$Meta(pagination: pagination ?? this.pagination);
  }

  CategoryListResponse$Meta copyWithWrapped({
    Wrapped<CategoryListResponse$Meta$Pagination?>? pagination,
  }) {
    return CategoryListResponse$Meta(
      pagination: (pagination != null ? pagination.value : this.pagination),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo {
  const Category$Photo({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.related,
    this.folder,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Photo.fromJson(Map<String, dynamic> json) =>
      _$Category$PhotoFromJson(json);

  static const toJsonFactory = _$Category$PhotoToJson;
  Map<String, dynamic> toJson() => _$Category$PhotoToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final dynamic formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final dynamic providerMetadata;
  @JsonKey(name: 'related', includeIfNull: false)
  final List<Category$Photo$Related$Item>? related;
  @JsonKey(name: 'folder', includeIfNull: false)
  final Category$Photo$Folder? folder;
  @JsonKey(name: 'folderPath', includeIfNull: false, defaultValue: '')
  final String? folderPath;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Photo$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Photo$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Photo$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Category$PhotoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(
                  other.related,
                  related,
                )) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.folderPath, folderPath) ||
                const DeepCollectionEquality().equals(
                  other.folderPath,
                  folderPath,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(folderPath) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$PhotoExtension on Category$Photo {
  Category$Photo copyWith({
    double? id,
    String? documentId,
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    dynamic formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    dynamic providerMetadata,
    List<Category$Photo$Related$Item>? related,
    Category$Photo$Folder? folder,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Photo$CreatedBy? createdBy,
    Category$Photo$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Photo$Localizations$Item>? localizations,
  }) {
    return Category$Photo(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      related: related ?? this.related,
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Photo copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<int?>? width,
    Wrapped<int?>? height,
    Wrapped<dynamic>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<dynamic>? providerMetadata,
    Wrapped<List<Category$Photo$Related$Item>?>? related,
    Wrapped<Category$Photo$Folder?>? folder,
    Wrapped<String?>? folderPath,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Photo$CreatedBy?>? createdBy,
    Wrapped<Category$Photo$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Category$Photo$Localizations$Item>?>? localizations,
  }) {
    return Category$Photo(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      related: (related != null ? related.value : this.related),
      folder: (folder != null ? folder.value : this.folder),
      folderPath: (folderPath != null ? folderPath.value : this.folderPath),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item {
  const Category$Products$Item({
    this.id,
    this.documentId,
    this.name,
    this.slug,
    this.price,
    this.photo,
    this.description,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Products$Item.fromJson(Map<String, dynamic> json) =>
      _$Category$Products$ItemFromJson(json);

  static const toJsonFactory = _$Category$Products$ItemToJson;
  Map<String, dynamic> toJson() => _$Category$Products$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'slug', includeIfNull: false, defaultValue: '')
  final String? slug;
  @JsonKey(name: 'price', includeIfNull: false)
  final double? price;
  @JsonKey(name: 'photo', includeIfNull: false)
  final List<Category$Products$Item$Photo$Item>? photo;
  @JsonKey(name: 'description', includeIfNull: false)
  final dynamic description;
  @JsonKey(name: 'category', includeIfNull: false)
  final Category$Products$Item$Category? category;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Products$Item$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Products$Item$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Products$Item$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Category$Products$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality().equals(
                  other.category,
                  category,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Products$ItemExtension on Category$Products$Item {
  Category$Products$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? slug,
    double? price,
    List<Category$Products$Item$Photo$Item>? photo,
    dynamic description,
    Category$Products$Item$Category? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Products$Item$CreatedBy? createdBy,
    Category$Products$Item$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Products$Item$Localizations$Item>? localizations,
  }) {
    return Category$Products$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      photo: photo ?? this.photo,
      description: description ?? this.description,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Products$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? slug,
    Wrapped<double?>? price,
    Wrapped<List<Category$Products$Item$Photo$Item>?>? photo,
    Wrapped<dynamic>? description,
    Wrapped<Category$Products$Item$Category?>? category,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Products$Item$CreatedBy?>? createdBy,
    Wrapped<Category$Products$Item$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Category$Products$Item$Localizations$Item>?>? localizations,
  }) {
    return Category$Products$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      slug: (slug != null ? slug.value : this.slug),
      price: (price != null ? price.value : this.price),
      photo: (photo != null ? photo.value : this.photo),
      description: (description != null ? description.value : this.description),
      category: (category != null ? category.value : this.category),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$CreatedBy {
  const Category$CreatedBy({this.id, this.documentId});

  factory Category$CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$Category$CreatedByFromJson(json);

  static const toJsonFactory = _$Category$CreatedByToJson;
  Map<String, dynamic> toJson() => _$Category$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$CreatedByExtension on Category$CreatedBy {
  Category$CreatedBy copyWith({double? id, String? documentId}) {
    return Category$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$UpdatedBy {
  const Category$UpdatedBy({this.id, this.documentId});

  factory Category$UpdatedBy.fromJson(Map<String, dynamic> json) =>
      _$Category$UpdatedByFromJson(json);

  static const toJsonFactory = _$Category$UpdatedByToJson;
  Map<String, dynamic> toJson() => _$Category$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$UpdatedByExtension on Category$UpdatedBy {
  Category$UpdatedBy copyWith({double? id, String? documentId}) {
    return Category$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Localizations$Item {
  const Category$Localizations$Item({this.id, this.documentId});

  factory Category$Localizations$Item.fromJson(Map<String, dynamic> json) =>
      _$Category$Localizations$ItemFromJson(json);

  static const toJsonFactory = _$Category$Localizations$ItemToJson;
  Map<String, dynamic> toJson() => _$Category$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Localizations$ItemExtension on Category$Localizations$Item {
  Category$Localizations$Item copyWith({double? id, String? documentId}) {
    return Category$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ProductRequest$Data {
  const ProductRequest$Data({
    required this.name,
    this.slug,
    required this.price,
    this.photo,
    this.description,
    this.category,
    this.locale,
    this.localizations,
  });

  factory ProductRequest$Data.fromJson(Map<String, dynamic> json) =>
      _$ProductRequest$DataFromJson(json);

  static const toJsonFactory = _$ProductRequest$DataToJson;
  Map<String, dynamic> toJson() => _$ProductRequest$DataToJson(this);

  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String name;
  @JsonKey(name: 'slug', includeIfNull: false, defaultValue: '')
  final String? slug;
  @JsonKey(name: 'price', includeIfNull: false)
  final double price;
  @JsonKey(name: 'photo', includeIfNull: false, defaultValue: <Object>[])
  final List<Object>? photo;
  @JsonKey(name: 'description', includeIfNull: false)
  final dynamic description;
  @JsonKey(name: 'category', includeIfNull: false)
  final dynamic category;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(
    name: 'localizations',
    includeIfNull: false,
    defaultValue: <Object>[],
  )
  final List<Object>? localizations;
  static const fromJsonFactory = _$ProductRequest$DataFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductRequest$Data &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality().equals(
                  other.category,
                  category,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $ProductRequest$DataExtension on ProductRequest$Data {
  ProductRequest$Data copyWith({
    String? name,
    String? slug,
    double? price,
    List<Object>? photo,
    dynamic description,
    dynamic category,
    String? locale,
    List<Object>? localizations,
  }) {
    return ProductRequest$Data(
      name: name ?? this.name,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      photo: photo ?? this.photo,
      description: description ?? this.description,
      category: category ?? this.category,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  ProductRequest$Data copyWithWrapped({
    Wrapped<String>? name,
    Wrapped<String?>? slug,
    Wrapped<double>? price,
    Wrapped<List<Object>?>? photo,
    Wrapped<dynamic>? description,
    Wrapped<dynamic>? category,
    Wrapped<String?>? locale,
    Wrapped<List<Object>?>? localizations,
  }) {
    return ProductRequest$Data(
      name: (name != null ? name.value : this.name),
      slug: (slug != null ? slug.value : this.slug),
      price: (price != null ? price.value : this.price),
      photo: (photo != null ? photo.value : this.photo),
      description: (description != null ? description.value : this.description),
      category: (category != null ? category.value : this.category),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ProductListResponse$Meta {
  const ProductListResponse$Meta({this.pagination});

  factory ProductListResponse$Meta.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponse$MetaFromJson(json);

  static const toJsonFactory = _$ProductListResponse$MetaToJson;
  Map<String, dynamic> toJson() => _$ProductListResponse$MetaToJson(this);

  @JsonKey(name: 'pagination', includeIfNull: false)
  final ProductListResponse$Meta$Pagination? pagination;
  static const fromJsonFactory = _$ProductListResponse$MetaFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductListResponse$Meta &&
            (identical(other.pagination, pagination) ||
                const DeepCollectionEquality().equals(
                  other.pagination,
                  pagination,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(pagination) ^ runtimeType.hashCode;
}

extension $ProductListResponse$MetaExtension on ProductListResponse$Meta {
  ProductListResponse$Meta copyWith({
    ProductListResponse$Meta$Pagination? pagination,
  }) {
    return ProductListResponse$Meta(pagination: pagination ?? this.pagination);
  }

  ProductListResponse$Meta copyWithWrapped({
    Wrapped<ProductListResponse$Meta$Pagination?>? pagination,
  }) {
    return ProductListResponse$Meta(
      pagination: (pagination != null ? pagination.value : this.pagination),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item {
  const Product$Photo$Item({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.related,
    this.folder,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Photo$Item.fromJson(Map<String, dynamic> json) =>
      _$Product$Photo$ItemFromJson(json);

  static const toJsonFactory = _$Product$Photo$ItemToJson;
  Map<String, dynamic> toJson() => _$Product$Photo$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final dynamic formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final dynamic providerMetadata;
  @JsonKey(name: 'related', includeIfNull: false)
  final List<Product$Photo$Item$Related$Item>? related;
  @JsonKey(name: 'folder', includeIfNull: false)
  final Product$Photo$Item$Folder? folder;
  @JsonKey(name: 'folderPath', includeIfNull: false, defaultValue: '')
  final String? folderPath;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Photo$Item$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Photo$Item$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Photo$Item$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Product$Photo$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(
                  other.related,
                  related,
                )) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.folderPath, folderPath) ||
                const DeepCollectionEquality().equals(
                  other.folderPath,
                  folderPath,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(folderPath) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Photo$ItemExtension on Product$Photo$Item {
  Product$Photo$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    dynamic formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    dynamic providerMetadata,
    List<Product$Photo$Item$Related$Item>? related,
    Product$Photo$Item$Folder? folder,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Photo$Item$CreatedBy? createdBy,
    Product$Photo$Item$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Photo$Item$Localizations$Item>? localizations,
  }) {
    return Product$Photo$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      related: related ?? this.related,
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Photo$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<int?>? width,
    Wrapped<int?>? height,
    Wrapped<dynamic>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<dynamic>? providerMetadata,
    Wrapped<List<Product$Photo$Item$Related$Item>?>? related,
    Wrapped<Product$Photo$Item$Folder?>? folder,
    Wrapped<String?>? folderPath,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$Photo$Item$CreatedBy?>? createdBy,
    Wrapped<Product$Photo$Item$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Product$Photo$Item$Localizations$Item>?>? localizations,
  }) {
    return Product$Photo$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      related: (related != null ? related.value : this.related),
      folder: (folder != null ? folder.value : this.folder),
      folderPath: (folderPath != null ? folderPath.value : this.folderPath),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category {
  const Product$Category({
    this.id,
    this.documentId,
    this.title,
    this.slug,
    this.description,
    this.photo,
    this.itemCount,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Category.fromJson(Map<String, dynamic> json) =>
      _$Product$CategoryFromJson(json);

  static const toJsonFactory = _$Product$CategoryToJson;
  Map<String, dynamic> toJson() => _$Product$CategoryToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String? title;
  @JsonKey(name: 'slug', includeIfNull: false, defaultValue: '')
  final String? slug;
  @JsonKey(name: 'description', includeIfNull: false)
  final dynamic description;
  @JsonKey(name: 'photo', includeIfNull: false)
  final Product$Category$Photo? photo;
  @JsonKey(name: 'ItemCount', includeIfNull: false)
  final int? itemCount;
  @JsonKey(name: 'products', includeIfNull: false)
  final List<Product$Category$Products$Item>? products;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Category$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Category$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Category$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Product$CategoryFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.itemCount, itemCount) ||
                const DeepCollectionEquality().equals(
                  other.itemCount,
                  itemCount,
                )) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality().equals(
                  other.products,
                  products,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(itemCount) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$CategoryExtension on Product$Category {
  Product$Category copyWith({
    double? id,
    String? documentId,
    String? title,
    String? slug,
    dynamic description,
    Product$Category$Photo? photo,
    int? itemCount,
    List<Product$Category$Products$Item>? products,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Category$CreatedBy? createdBy,
    Product$Category$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Category$Localizations$Item>? localizations,
  }) {
    return Product$Category(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      itemCount: itemCount ?? this.itemCount,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Category copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? title,
    Wrapped<String?>? slug,
    Wrapped<dynamic>? description,
    Wrapped<Product$Category$Photo?>? photo,
    Wrapped<int?>? itemCount,
    Wrapped<List<Product$Category$Products$Item>?>? products,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$Category$CreatedBy?>? createdBy,
    Wrapped<Product$Category$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Product$Category$Localizations$Item>?>? localizations,
  }) {
    return Product$Category(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      title: (title != null ? title.value : this.title),
      slug: (slug != null ? slug.value : this.slug),
      description: (description != null ? description.value : this.description),
      photo: (photo != null ? photo.value : this.photo),
      itemCount: (itemCount != null ? itemCount.value : this.itemCount),
      products: (products != null ? products.value : this.products),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$CreatedBy {
  const Product$CreatedBy({this.id, this.documentId});

  factory Product$CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$Product$CreatedByFromJson(json);

  static const toJsonFactory = _$Product$CreatedByToJson;
  Map<String, dynamic> toJson() => _$Product$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$CreatedByExtension on Product$CreatedBy {
  Product$CreatedBy copyWith({double? id, String? documentId}) {
    return Product$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$UpdatedBy {
  const Product$UpdatedBy({this.id, this.documentId});

  factory Product$UpdatedBy.fromJson(Map<String, dynamic> json) =>
      _$Product$UpdatedByFromJson(json);

  static const toJsonFactory = _$Product$UpdatedByToJson;
  Map<String, dynamic> toJson() => _$Product$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$UpdatedByExtension on Product$UpdatedBy {
  Product$UpdatedBy copyWith({double? id, String? documentId}) {
    return Product$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Localizations$Item {
  const Product$Localizations$Item({this.id, this.documentId});

  factory Product$Localizations$Item.fromJson(Map<String, dynamic> json) =>
      _$Product$Localizations$ItemFromJson(json);

  static const toJsonFactory = _$Product$Localizations$ItemToJson;
  Map<String, dynamic> toJson() => _$Product$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Localizations$ItemExtension on Product$Localizations$Item {
  Product$Localizations$Item copyWith({double? id, String? documentId}) {
    return Product$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class UploadIdIdPost$RequestBody$FileInfo {
  const UploadIdIdPost$RequestBody$FileInfo({
    this.name,
    this.alternativeText,
    this.caption,
  });

  factory UploadIdIdPost$RequestBody$FileInfo.fromJson(
    Map<String, dynamic> json,
  ) => _$UploadIdIdPost$RequestBody$FileInfoFromJson(json);

  static const toJsonFactory = _$UploadIdIdPost$RequestBody$FileInfoToJson;
  Map<String, dynamic> toJson() =>
      _$UploadIdIdPost$RequestBody$FileInfoToJson(this);

  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  static const fromJsonFactory = _$UploadIdIdPost$RequestBody$FileInfoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UploadIdIdPost$RequestBody$FileInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(other.caption, caption)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      runtimeType.hashCode;
}

extension $UploadIdIdPost$RequestBody$FileInfoExtension
    on UploadIdIdPost$RequestBody$FileInfo {
  UploadIdIdPost$RequestBody$FileInfo copyWith({
    String? name,
    String? alternativeText,
    String? caption,
  }) {
    return UploadIdIdPost$RequestBody$FileInfo(
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
    );
  }

  UploadIdIdPost$RequestBody$FileInfo copyWithWrapped({
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
  }) {
    return UploadIdIdPost$RequestBody$FileInfo(
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryListResponse$Meta$Pagination {
  const CategoryListResponse$Meta$Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory CategoryListResponse$Meta$Pagination.fromJson(
    Map<String, dynamic> json,
  ) => _$CategoryListResponse$Meta$PaginationFromJson(json);

  static const toJsonFactory = _$CategoryListResponse$Meta$PaginationToJson;
  Map<String, dynamic> toJson() =>
      _$CategoryListResponse$Meta$PaginationToJson(this);

  @JsonKey(name: 'page', includeIfNull: false)
  final int? page;
  @JsonKey(name: 'pageSize', includeIfNull: false)
  final int? pageSize;
  @JsonKey(name: 'pageCount', includeIfNull: false)
  final int? pageCount;
  @JsonKey(name: 'total', includeIfNull: false)
  final int? total;
  static const fromJsonFactory = _$CategoryListResponse$Meta$PaginationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryListResponse$Meta$Pagination &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality().equals(
                  other.pageSize,
                  pageSize,
                )) &&
            (identical(other.pageCount, pageCount) ||
                const DeepCollectionEquality().equals(
                  other.pageCount,
                  pageCount,
                )) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageCount) ^
      const DeepCollectionEquality().hash(total) ^
      runtimeType.hashCode;
}

extension $CategoryListResponse$Meta$PaginationExtension
    on CategoryListResponse$Meta$Pagination {
  CategoryListResponse$Meta$Pagination copyWith({
    int? page,
    int? pageSize,
    int? pageCount,
    int? total,
  }) {
    return CategoryListResponse$Meta$Pagination(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      pageCount: pageCount ?? this.pageCount,
      total: total ?? this.total,
    );
  }

  CategoryListResponse$Meta$Pagination copyWithWrapped({
    Wrapped<int?>? page,
    Wrapped<int?>? pageSize,
    Wrapped<int?>? pageCount,
    Wrapped<int?>? total,
  }) {
    return CategoryListResponse$Meta$Pagination(
      page: (page != null ? page.value : this.page),
      pageSize: (pageSize != null ? pageSize.value : this.pageSize),
      pageCount: (pageCount != null ? pageCount.value : this.pageCount),
      total: (total != null ? total.value : this.total),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Related$Item {
  const Category$Photo$Related$Item({this.id, this.documentId});

  factory Category$Photo$Related$Item.fromJson(Map<String, dynamic> json) =>
      _$Category$Photo$Related$ItemFromJson(json);

  static const toJsonFactory = _$Category$Photo$Related$ItemToJson;
  Map<String, dynamic> toJson() => _$Category$Photo$Related$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Photo$Related$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Related$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Related$ItemExtension on Category$Photo$Related$Item {
  Category$Photo$Related$Item copyWith({double? id, String? documentId}) {
    return Category$Photo$Related$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Related$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Related$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder {
  const Category$Photo$Folder({
    this.id,
    this.documentId,
    this.name,
    this.pathId,
    this.parent,
    this.children,
    this.files,
    this.path,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Photo$Folder.fromJson(Map<String, dynamic> json) =>
      _$Category$Photo$FolderFromJson(json);

  static const toJsonFactory = _$Category$Photo$FolderToJson;
  Map<String, dynamic> toJson() => _$Category$Photo$FolderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'pathId', includeIfNull: false)
  final int? pathId;
  @JsonKey(name: 'parent', includeIfNull: false)
  final Category$Photo$Folder$Parent? parent;
  @JsonKey(name: 'children', includeIfNull: false)
  final List<Category$Photo$Folder$Children$Item>? children;
  @JsonKey(name: 'files', includeIfNull: false)
  final List<Category$Photo$Folder$Files$Item>? files;
  @JsonKey(name: 'path', includeIfNull: false, defaultValue: '')
  final String? path;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Photo$Folder$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Photo$Folder$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Photo$Folder$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Category$Photo$FolderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.pathId, pathId) ||
                const DeepCollectionEquality().equals(other.pathId, pathId)) &&
            (identical(other.parent, parent) ||
                const DeepCollectionEquality().equals(other.parent, parent)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality().equals(
                  other.children,
                  children,
                )) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(pathId) ^
      const DeepCollectionEquality().hash(parent) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(files) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Photo$FolderExtension on Category$Photo$Folder {
  Category$Photo$Folder copyWith({
    double? id,
    String? documentId,
    String? name,
    int? pathId,
    Category$Photo$Folder$Parent? parent,
    List<Category$Photo$Folder$Children$Item>? children,
    List<Category$Photo$Folder$Files$Item>? files,
    String? path,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Photo$Folder$CreatedBy? createdBy,
    Category$Photo$Folder$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Photo$Folder$Localizations$Item>? localizations,
  }) {
    return Category$Photo$Folder(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      pathId: pathId ?? this.pathId,
      parent: parent ?? this.parent,
      children: children ?? this.children,
      files: files ?? this.files,
      path: path ?? this.path,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Photo$Folder copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<int?>? pathId,
    Wrapped<Category$Photo$Folder$Parent?>? parent,
    Wrapped<List<Category$Photo$Folder$Children$Item>?>? children,
    Wrapped<List<Category$Photo$Folder$Files$Item>?>? files,
    Wrapped<String?>? path,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Photo$Folder$CreatedBy?>? createdBy,
    Wrapped<Category$Photo$Folder$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Category$Photo$Folder$Localizations$Item>?>? localizations,
  }) {
    return Category$Photo$Folder(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      pathId: (pathId != null ? pathId.value : this.pathId),
      parent: (parent != null ? parent.value : this.parent),
      children: (children != null ? children.value : this.children),
      files: (files != null ? files.value : this.files),
      path: (path != null ? path.value : this.path),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$CreatedBy {
  const Category$Photo$CreatedBy({this.id, this.documentId});

  factory Category$Photo$CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$Category$Photo$CreatedByFromJson(json);

  static const toJsonFactory = _$Category$Photo$CreatedByToJson;
  Map<String, dynamic> toJson() => _$Category$Photo$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Photo$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$CreatedByExtension on Category$Photo$CreatedBy {
  Category$Photo$CreatedBy copyWith({double? id, String? documentId}) {
    return Category$Photo$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$UpdatedBy {
  const Category$Photo$UpdatedBy({this.id, this.documentId});

  factory Category$Photo$UpdatedBy.fromJson(Map<String, dynamic> json) =>
      _$Category$Photo$UpdatedByFromJson(json);

  static const toJsonFactory = _$Category$Photo$UpdatedByToJson;
  Map<String, dynamic> toJson() => _$Category$Photo$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Photo$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$UpdatedByExtension on Category$Photo$UpdatedBy {
  Category$Photo$UpdatedBy copyWith({double? id, String? documentId}) {
    return Category$Photo$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Localizations$Item {
  const Category$Photo$Localizations$Item({this.id, this.documentId});

  factory Category$Photo$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Localizations$ItemFromJson(json);

  static const toJsonFactory = _$Category$Photo$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Photo$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Localizations$ItemExtension
    on Category$Photo$Localizations$Item {
  Category$Photo$Localizations$Item copyWith({double? id, String? documentId}) {
    return Category$Photo$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Photo$Item {
  const Category$Products$Item$Photo$Item({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.related,
    this.folder,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Products$Item$Photo$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Photo$ItemFromJson(json);

  static const toJsonFactory = _$Category$Products$Item$Photo$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Photo$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final dynamic formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final dynamic providerMetadata;
  @JsonKey(name: 'related', includeIfNull: false)
  final List<Category$Products$Item$Photo$Item$Related$Item>? related;
  @JsonKey(name: 'folder', includeIfNull: false)
  final Category$Products$Item$Photo$Item$Folder? folder;
  @JsonKey(name: 'folderPath', includeIfNull: false, defaultValue: '')
  final String? folderPath;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Products$Item$Photo$Item$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Products$Item$Photo$Item$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Products$Item$Photo$Item$Localizations$Item>?
  localizations;
  static const fromJsonFactory = _$Category$Products$Item$Photo$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Photo$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(
                  other.related,
                  related,
                )) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.folderPath, folderPath) ||
                const DeepCollectionEquality().equals(
                  other.folderPath,
                  folderPath,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(folderPath) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Photo$ItemExtension
    on Category$Products$Item$Photo$Item {
  Category$Products$Item$Photo$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    dynamic formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    dynamic providerMetadata,
    List<Category$Products$Item$Photo$Item$Related$Item>? related,
    Category$Products$Item$Photo$Item$Folder? folder,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Products$Item$Photo$Item$CreatedBy? createdBy,
    Category$Products$Item$Photo$Item$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Products$Item$Photo$Item$Localizations$Item>? localizations,
  }) {
    return Category$Products$Item$Photo$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      related: related ?? this.related,
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Products$Item$Photo$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<int?>? width,
    Wrapped<int?>? height,
    Wrapped<dynamic>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<dynamic>? providerMetadata,
    Wrapped<List<Category$Products$Item$Photo$Item$Related$Item>?>? related,
    Wrapped<Category$Products$Item$Photo$Item$Folder?>? folder,
    Wrapped<String?>? folderPath,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Products$Item$Photo$Item$CreatedBy?>? createdBy,
    Wrapped<Category$Products$Item$Photo$Item$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Category$Products$Item$Photo$Item$Localizations$Item>?>?
    localizations,
  }) {
    return Category$Products$Item$Photo$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      related: (related != null ? related.value : this.related),
      folder: (folder != null ? folder.value : this.folder),
      folderPath: (folderPath != null ? folderPath.value : this.folderPath),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category {
  const Category$Products$Item$Category({
    this.id,
    this.documentId,
    this.title,
    this.slug,
    this.description,
    this.photo,
    this.itemCount,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Products$Item$Category.fromJson(Map<String, dynamic> json) =>
      _$Category$Products$Item$CategoryFromJson(json);

  static const toJsonFactory = _$Category$Products$Item$CategoryToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$CategoryToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String? title;
  @JsonKey(name: 'slug', includeIfNull: false, defaultValue: '')
  final String? slug;
  @JsonKey(name: 'description', includeIfNull: false)
  final dynamic description;
  @JsonKey(name: 'photo', includeIfNull: false)
  final Category$Products$Item$Category$Photo? photo;
  @JsonKey(name: 'ItemCount', includeIfNull: false)
  final int? itemCount;
  @JsonKey(name: 'products', includeIfNull: false)
  final List<Category$Products$Item$Category$Products$Item>? products;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Products$Item$Category$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Products$Item$Category$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Products$Item$Category$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Category$Products$Item$CategoryFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.itemCount, itemCount) ||
                const DeepCollectionEquality().equals(
                  other.itemCount,
                  itemCount,
                )) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality().equals(
                  other.products,
                  products,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(itemCount) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$CategoryExtension
    on Category$Products$Item$Category {
  Category$Products$Item$Category copyWith({
    double? id,
    String? documentId,
    String? title,
    String? slug,
    dynamic description,
    Category$Products$Item$Category$Photo? photo,
    int? itemCount,
    List<Category$Products$Item$Category$Products$Item>? products,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Products$Item$Category$CreatedBy? createdBy,
    Category$Products$Item$Category$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Products$Item$Category$Localizations$Item>? localizations,
  }) {
    return Category$Products$Item$Category(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      itemCount: itemCount ?? this.itemCount,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Products$Item$Category copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? title,
    Wrapped<String?>? slug,
    Wrapped<dynamic>? description,
    Wrapped<Category$Products$Item$Category$Photo?>? photo,
    Wrapped<int?>? itemCount,
    Wrapped<List<Category$Products$Item$Category$Products$Item>?>? products,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Products$Item$Category$CreatedBy?>? createdBy,
    Wrapped<Category$Products$Item$Category$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Category$Products$Item$Category$Localizations$Item>?>?
    localizations,
  }) {
    return Category$Products$Item$Category(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      title: (title != null ? title.value : this.title),
      slug: (slug != null ? slug.value : this.slug),
      description: (description != null ? description.value : this.description),
      photo: (photo != null ? photo.value : this.photo),
      itemCount: (itemCount != null ? itemCount.value : this.itemCount),
      products: (products != null ? products.value : this.products),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$CreatedBy {
  const Category$Products$Item$CreatedBy({this.id, this.documentId});

  factory Category$Products$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$CreatedByFromJson(json);

  static const toJsonFactory = _$Category$Products$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Products$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$CreatedByExtension
    on Category$Products$Item$CreatedBy {
  Category$Products$Item$CreatedBy copyWith({double? id, String? documentId}) {
    return Category$Products$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$UpdatedBy {
  const Category$Products$Item$UpdatedBy({this.id, this.documentId});

  factory Category$Products$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$UpdatedByFromJson(json);

  static const toJsonFactory = _$Category$Products$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Products$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$UpdatedByExtension
    on Category$Products$Item$UpdatedBy {
  Category$Products$Item$UpdatedBy copyWith({double? id, String? documentId}) {
    return Category$Products$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Localizations$Item {
  const Category$Products$Item$Localizations$Item({this.id, this.documentId});

  factory Category$Products$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Localizations$ItemExtension
    on Category$Products$Item$Localizations$Item {
  Category$Products$Item$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ProductListResponse$Meta$Pagination {
  const ProductListResponse$Meta$Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory ProductListResponse$Meta$Pagination.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductListResponse$Meta$PaginationFromJson(json);

  static const toJsonFactory = _$ProductListResponse$Meta$PaginationToJson;
  Map<String, dynamic> toJson() =>
      _$ProductListResponse$Meta$PaginationToJson(this);

  @JsonKey(name: 'page', includeIfNull: false)
  final int? page;
  @JsonKey(name: 'pageSize', includeIfNull: false)
  final int? pageSize;
  @JsonKey(name: 'pageCount', includeIfNull: false)
  final int? pageCount;
  @JsonKey(name: 'total', includeIfNull: false)
  final int? total;
  static const fromJsonFactory = _$ProductListResponse$Meta$PaginationFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProductListResponse$Meta$Pagination &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.pageSize, pageSize) ||
                const DeepCollectionEquality().equals(
                  other.pageSize,
                  pageSize,
                )) &&
            (identical(other.pageCount, pageCount) ||
                const DeepCollectionEquality().equals(
                  other.pageCount,
                  pageCount,
                )) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(pageSize) ^
      const DeepCollectionEquality().hash(pageCount) ^
      const DeepCollectionEquality().hash(total) ^
      runtimeType.hashCode;
}

extension $ProductListResponse$Meta$PaginationExtension
    on ProductListResponse$Meta$Pagination {
  ProductListResponse$Meta$Pagination copyWith({
    int? page,
    int? pageSize,
    int? pageCount,
    int? total,
  }) {
    return ProductListResponse$Meta$Pagination(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      pageCount: pageCount ?? this.pageCount,
      total: total ?? this.total,
    );
  }

  ProductListResponse$Meta$Pagination copyWithWrapped({
    Wrapped<int?>? page,
    Wrapped<int?>? pageSize,
    Wrapped<int?>? pageCount,
    Wrapped<int?>? total,
  }) {
    return ProductListResponse$Meta$Pagination(
      page: (page != null ? page.value : this.page),
      pageSize: (pageSize != null ? pageSize.value : this.pageSize),
      pageCount: (pageCount != null ? pageCount.value : this.pageCount),
      total: (total != null ? total.value : this.total),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Related$Item {
  const Product$Photo$Item$Related$Item({this.id, this.documentId});

  factory Product$Photo$Item$Related$Item.fromJson(Map<String, dynamic> json) =>
      _$Product$Photo$Item$Related$ItemFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$Related$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Related$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Photo$Item$Related$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Related$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Related$ItemExtension
    on Product$Photo$Item$Related$Item {
  Product$Photo$Item$Related$Item copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$Related$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Related$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Related$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder {
  const Product$Photo$Item$Folder({
    this.id,
    this.documentId,
    this.name,
    this.pathId,
    this.parent,
    this.children,
    this.files,
    this.path,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Photo$Item$Folder.fromJson(Map<String, dynamic> json) =>
      _$Product$Photo$Item$FolderFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$FolderToJson;
  Map<String, dynamic> toJson() => _$Product$Photo$Item$FolderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'pathId', includeIfNull: false)
  final int? pathId;
  @JsonKey(name: 'parent', includeIfNull: false)
  final Product$Photo$Item$Folder$Parent? parent;
  @JsonKey(name: 'children', includeIfNull: false)
  final List<Product$Photo$Item$Folder$Children$Item>? children;
  @JsonKey(name: 'files', includeIfNull: false)
  final List<Product$Photo$Item$Folder$Files$Item>? files;
  @JsonKey(name: 'path', includeIfNull: false, defaultValue: '')
  final String? path;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Photo$Item$Folder$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Photo$Item$Folder$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Photo$Item$Folder$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Product$Photo$Item$FolderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.pathId, pathId) ||
                const DeepCollectionEquality().equals(other.pathId, pathId)) &&
            (identical(other.parent, parent) ||
                const DeepCollectionEquality().equals(other.parent, parent)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality().equals(
                  other.children,
                  children,
                )) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(pathId) ^
      const DeepCollectionEquality().hash(parent) ^
      const DeepCollectionEquality().hash(children) ^
      const DeepCollectionEquality().hash(files) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$FolderExtension on Product$Photo$Item$Folder {
  Product$Photo$Item$Folder copyWith({
    double? id,
    String? documentId,
    String? name,
    int? pathId,
    Product$Photo$Item$Folder$Parent? parent,
    List<Product$Photo$Item$Folder$Children$Item>? children,
    List<Product$Photo$Item$Folder$Files$Item>? files,
    String? path,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Photo$Item$Folder$CreatedBy? createdBy,
    Product$Photo$Item$Folder$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Photo$Item$Folder$Localizations$Item>? localizations,
  }) {
    return Product$Photo$Item$Folder(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      pathId: pathId ?? this.pathId,
      parent: parent ?? this.parent,
      children: children ?? this.children,
      files: files ?? this.files,
      path: path ?? this.path,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Photo$Item$Folder copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<int?>? pathId,
    Wrapped<Product$Photo$Item$Folder$Parent?>? parent,
    Wrapped<List<Product$Photo$Item$Folder$Children$Item>?>? children,
    Wrapped<List<Product$Photo$Item$Folder$Files$Item>?>? files,
    Wrapped<String?>? path,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$Photo$Item$Folder$CreatedBy?>? createdBy,
    Wrapped<Product$Photo$Item$Folder$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Product$Photo$Item$Folder$Localizations$Item>?>? localizations,
  }) {
    return Product$Photo$Item$Folder(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      pathId: (pathId != null ? pathId.value : this.pathId),
      parent: (parent != null ? parent.value : this.parent),
      children: (children != null ? children.value : this.children),
      files: (files != null ? files.value : this.files),
      path: (path != null ? path.value : this.path),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$CreatedBy {
  const Product$Photo$Item$CreatedBy({this.id, this.documentId});

  factory Product$Photo$Item$CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$Product$Photo$Item$CreatedByFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$CreatedByToJson;
  Map<String, dynamic> toJson() => _$Product$Photo$Item$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Photo$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$CreatedByExtension
    on Product$Photo$Item$CreatedBy {
  Product$Photo$Item$CreatedBy copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$UpdatedBy {
  const Product$Photo$Item$UpdatedBy({this.id, this.documentId});

  factory Product$Photo$Item$UpdatedBy.fromJson(Map<String, dynamic> json) =>
      _$Product$Photo$Item$UpdatedByFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() => _$Product$Photo$Item$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Photo$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$UpdatedByExtension
    on Product$Photo$Item$UpdatedBy {
  Product$Photo$Item$UpdatedBy copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Localizations$Item {
  const Product$Photo$Item$Localizations$Item({this.id, this.documentId});

  factory Product$Photo$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Localizations$ItemFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Localizations$ItemExtension
    on Product$Photo$Item$Localizations$Item {
  Product$Photo$Item$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Photo {
  const Product$Category$Photo({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.related,
    this.folder,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Category$Photo.fromJson(Map<String, dynamic> json) =>
      _$Product$Category$PhotoFromJson(json);

  static const toJsonFactory = _$Product$Category$PhotoToJson;
  Map<String, dynamic> toJson() => _$Product$Category$PhotoToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final dynamic formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final dynamic providerMetadata;
  @JsonKey(name: 'related', includeIfNull: false)
  final List<Product$Category$Photo$Related$Item>? related;
  @JsonKey(name: 'folder', includeIfNull: false)
  final Product$Category$Photo$Folder? folder;
  @JsonKey(name: 'folderPath', includeIfNull: false, defaultValue: '')
  final String? folderPath;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Category$Photo$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Category$Photo$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Category$Photo$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Product$Category$PhotoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Photo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(
                  other.related,
                  related,
                )) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.folderPath, folderPath) ||
                const DeepCollectionEquality().equals(
                  other.folderPath,
                  folderPath,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(folderPath) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Category$PhotoExtension on Product$Category$Photo {
  Product$Category$Photo copyWith({
    double? id,
    String? documentId,
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    dynamic formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    dynamic providerMetadata,
    List<Product$Category$Photo$Related$Item>? related,
    Product$Category$Photo$Folder? folder,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Category$Photo$CreatedBy? createdBy,
    Product$Category$Photo$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Category$Photo$Localizations$Item>? localizations,
  }) {
    return Product$Category$Photo(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      related: related ?? this.related,
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Category$Photo copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<int?>? width,
    Wrapped<int?>? height,
    Wrapped<dynamic>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<dynamic>? providerMetadata,
    Wrapped<List<Product$Category$Photo$Related$Item>?>? related,
    Wrapped<Product$Category$Photo$Folder?>? folder,
    Wrapped<String?>? folderPath,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$Category$Photo$CreatedBy?>? createdBy,
    Wrapped<Product$Category$Photo$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Product$Category$Photo$Localizations$Item>?>? localizations,
  }) {
    return Product$Category$Photo(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      related: (related != null ? related.value : this.related),
      folder: (folder != null ? folder.value : this.folder),
      folderPath: (folderPath != null ? folderPath.value : this.folderPath),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item {
  const Product$Category$Products$Item({
    this.id,
    this.documentId,
    this.name,
    this.slug,
    this.price,
    this.photo,
    this.description,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Category$Products$Item.fromJson(Map<String, dynamic> json) =>
      _$Product$Category$Products$ItemFromJson(json);

  static const toJsonFactory = _$Product$Category$Products$ItemToJson;
  Map<String, dynamic> toJson() => _$Product$Category$Products$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'slug', includeIfNull: false, defaultValue: '')
  final String? slug;
  @JsonKey(name: 'price', includeIfNull: false)
  final double? price;
  @JsonKey(name: 'photo', includeIfNull: false)
  final List<Product$Category$Products$Item$Photo$Item>? photo;
  @JsonKey(name: 'description', includeIfNull: false)
  final dynamic description;
  @JsonKey(name: 'category', includeIfNull: false)
  final Product$Category$Products$Item$Category? category;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Category$Products$Item$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Category$Products$Item$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Category$Products$Item$Localizations$Item>? localizations;
  static const fromJsonFactory = _$Product$Category$Products$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality().equals(
                  other.category,
                  category,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$ItemExtension
    on Product$Category$Products$Item {
  Product$Category$Products$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? slug,
    double? price,
    List<Product$Category$Products$Item$Photo$Item>? photo,
    dynamic description,
    Product$Category$Products$Item$Category? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Category$Products$Item$CreatedBy? createdBy,
    Product$Category$Products$Item$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Category$Products$Item$Localizations$Item>? localizations,
  }) {
    return Product$Category$Products$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      photo: photo ?? this.photo,
      description: description ?? this.description,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Category$Products$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? slug,
    Wrapped<double?>? price,
    Wrapped<List<Product$Category$Products$Item$Photo$Item>?>? photo,
    Wrapped<dynamic>? description,
    Wrapped<Product$Category$Products$Item$Category?>? category,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$Category$Products$Item$CreatedBy?>? createdBy,
    Wrapped<Product$Category$Products$Item$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Product$Category$Products$Item$Localizations$Item>?>?
    localizations,
  }) {
    return Product$Category$Products$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      slug: (slug != null ? slug.value : this.slug),
      price: (price != null ? price.value : this.price),
      photo: (photo != null ? photo.value : this.photo),
      description: (description != null ? description.value : this.description),
      category: (category != null ? category.value : this.category),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$CreatedBy {
  const Product$Category$CreatedBy({this.id, this.documentId});

  factory Product$Category$CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$Product$Category$CreatedByFromJson(json);

  static const toJsonFactory = _$Product$Category$CreatedByToJson;
  Map<String, dynamic> toJson() => _$Product$Category$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Category$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$CreatedByExtension on Product$Category$CreatedBy {
  Product$Category$CreatedBy copyWith({double? id, String? documentId}) {
    return Product$Category$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$UpdatedBy {
  const Product$Category$UpdatedBy({this.id, this.documentId});

  factory Product$Category$UpdatedBy.fromJson(Map<String, dynamic> json) =>
      _$Product$Category$UpdatedByFromJson(json);

  static const toJsonFactory = _$Product$Category$UpdatedByToJson;
  Map<String, dynamic> toJson() => _$Product$Category$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Category$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$UpdatedByExtension on Product$Category$UpdatedBy {
  Product$Category$UpdatedBy copyWith({double? id, String? documentId}) {
    return Product$Category$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Localizations$Item {
  const Product$Category$Localizations$Item({this.id, this.documentId});

  factory Product$Category$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Localizations$ItemFromJson(json);

  static const toJsonFactory = _$Product$Category$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Category$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Localizations$ItemExtension
    on Product$Category$Localizations$Item {
  Product$Category$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Parent {
  const Category$Photo$Folder$Parent({this.id, this.documentId});

  factory Category$Photo$Folder$Parent.fromJson(Map<String, dynamic> json) =>
      _$Category$Photo$Folder$ParentFromJson(json);

  static const toJsonFactory = _$Category$Photo$Folder$ParentToJson;
  Map<String, dynamic> toJson() => _$Category$Photo$Folder$ParentToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Photo$Folder$ParentFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Parent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$ParentExtension
    on Category$Photo$Folder$Parent {
  Category$Photo$Folder$Parent copyWith({double? id, String? documentId}) {
    return Category$Photo$Folder$Parent(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Parent copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Parent(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Children$Item {
  const Category$Photo$Folder$Children$Item({this.id, this.documentId});

  factory Category$Photo$Folder$Children$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Children$ItemFromJson(json);

  static const toJsonFactory = _$Category$Photo$Folder$Children$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Children$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Photo$Folder$Children$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Children$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Children$ItemExtension
    on Category$Photo$Folder$Children$Item {
  Category$Photo$Folder$Children$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Children$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Children$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Children$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item {
  const Category$Photo$Folder$Files$Item({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.related,
    this.folder,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Photo$Folder$Files$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$ItemFromJson(json);

  static const toJsonFactory = _$Category$Photo$Folder$Files$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final dynamic formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final dynamic providerMetadata;
  @JsonKey(name: 'related', includeIfNull: false)
  final List<Category$Photo$Folder$Files$Item$Related$Item>? related;
  @JsonKey(name: 'folder', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$Folder? folder;
  @JsonKey(name: 'folderPath', includeIfNull: false, defaultValue: '')
  final String? folderPath;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Photo$Folder$Files$Item$Localizations$Item>?
  localizations;
  static const fromJsonFactory = _$Category$Photo$Folder$Files$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(
                  other.related,
                  related,
                )) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.folderPath, folderPath) ||
                const DeepCollectionEquality().equals(
                  other.folderPath,
                  folderPath,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(folderPath) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$ItemExtension
    on Category$Photo$Folder$Files$Item {
  Category$Photo$Folder$Files$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    dynamic formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    dynamic providerMetadata,
    List<Category$Photo$Folder$Files$Item$Related$Item>? related,
    Category$Photo$Folder$Files$Item$Folder? folder,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Photo$Folder$Files$Item$CreatedBy? createdBy,
    Category$Photo$Folder$Files$Item$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Photo$Folder$Files$Item$Localizations$Item>? localizations,
  }) {
    return Category$Photo$Folder$Files$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      related: related ?? this.related,
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Photo$Folder$Files$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<int?>? width,
    Wrapped<int?>? height,
    Wrapped<dynamic>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<dynamic>? providerMetadata,
    Wrapped<List<Category$Photo$Folder$Files$Item$Related$Item>?>? related,
    Wrapped<Category$Photo$Folder$Files$Item$Folder?>? folder,
    Wrapped<String?>? folderPath,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Photo$Folder$Files$Item$CreatedBy?>? createdBy,
    Wrapped<Category$Photo$Folder$Files$Item$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Category$Photo$Folder$Files$Item$Localizations$Item>?>?
    localizations,
  }) {
    return Category$Photo$Folder$Files$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      related: (related != null ? related.value : this.related),
      folder: (folder != null ? folder.value : this.folder),
      folderPath: (folderPath != null ? folderPath.value : this.folderPath),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$CreatedBy {
  const Category$Photo$Folder$CreatedBy({this.id, this.documentId});

  factory Category$Photo$Folder$CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$Category$Photo$Folder$CreatedByFromJson(json);

  static const toJsonFactory = _$Category$Photo$Folder$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Photo$Folder$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$CreatedByExtension
    on Category$Photo$Folder$CreatedBy {
  Category$Photo$Folder$CreatedBy copyWith({double? id, String? documentId}) {
    return Category$Photo$Folder$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$UpdatedBy {
  const Category$Photo$Folder$UpdatedBy({this.id, this.documentId});

  factory Category$Photo$Folder$UpdatedBy.fromJson(Map<String, dynamic> json) =>
      _$Category$Photo$Folder$UpdatedByFromJson(json);

  static const toJsonFactory = _$Category$Photo$Folder$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Category$Photo$Folder$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$UpdatedByExtension
    on Category$Photo$Folder$UpdatedBy {
  Category$Photo$Folder$UpdatedBy copyWith({double? id, String? documentId}) {
    return Category$Photo$Folder$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Localizations$Item {
  const Category$Photo$Folder$Localizations$Item({this.id, this.documentId});

  factory Category$Photo$Folder$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Localizations$ItemFromJson(json);

  static const toJsonFactory = _$Category$Photo$Folder$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Localizations$ItemExtension
    on Category$Photo$Folder$Localizations$Item {
  Category$Photo$Folder$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Photo$Item$Related$Item {
  const Category$Products$Item$Photo$Item$Related$Item({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Photo$Item$Related$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Photo$Item$Related$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Photo$Item$Related$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Photo$Item$Related$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Photo$Item$Related$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Photo$Item$Related$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Photo$Item$Related$ItemExtension
    on Category$Products$Item$Photo$Item$Related$Item {
  Category$Products$Item$Photo$Item$Related$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Photo$Item$Related$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Photo$Item$Related$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Photo$Item$Related$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Photo$Item$Folder {
  const Category$Products$Item$Photo$Item$Folder({this.id, this.documentId});

  factory Category$Products$Item$Photo$Item$Folder.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Photo$Item$FolderFromJson(json);

  static const toJsonFactory = _$Category$Products$Item$Photo$Item$FolderToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Photo$Item$FolderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Photo$Item$FolderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Photo$Item$Folder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Photo$Item$FolderExtension
    on Category$Products$Item$Photo$Item$Folder {
  Category$Products$Item$Photo$Item$Folder copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Photo$Item$Folder(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Photo$Item$Folder copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Photo$Item$Folder(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Photo$Item$CreatedBy {
  const Category$Products$Item$Photo$Item$CreatedBy({this.id, this.documentId});

  factory Category$Products$Item$Photo$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Photo$Item$CreatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Photo$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Photo$Item$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Photo$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Photo$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Photo$Item$CreatedByExtension
    on Category$Products$Item$Photo$Item$CreatedBy {
  Category$Products$Item$Photo$Item$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Photo$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Photo$Item$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Photo$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Photo$Item$UpdatedBy {
  const Category$Products$Item$Photo$Item$UpdatedBy({this.id, this.documentId});

  factory Category$Products$Item$Photo$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Photo$Item$UpdatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Photo$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Photo$Item$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Photo$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Photo$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Photo$Item$UpdatedByExtension
    on Category$Products$Item$Photo$Item$UpdatedBy {
  Category$Products$Item$Photo$Item$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Photo$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Photo$Item$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Photo$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Photo$Item$Localizations$Item {
  const Category$Products$Item$Photo$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Photo$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Photo$Item$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Photo$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Photo$Item$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Photo$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Photo$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Photo$Item$Localizations$ItemExtension
    on Category$Products$Item$Photo$Item$Localizations$Item {
  Category$Products$Item$Photo$Item$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Photo$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Photo$Item$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Photo$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$Photo {
  const Category$Products$Item$Category$Photo({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.related,
    this.folder,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Products$Item$Category$Photo.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$PhotoFromJson(json);

  static const toJsonFactory = _$Category$Products$Item$Category$PhotoToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$PhotoToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final dynamic formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final dynamic providerMetadata;
  @JsonKey(name: 'related', includeIfNull: false)
  final List<Category$Products$Item$Category$Photo$Related$Item>? related;
  @JsonKey(name: 'folder', includeIfNull: false)
  final Category$Products$Item$Category$Photo$Folder? folder;
  @JsonKey(name: 'folderPath', includeIfNull: false, defaultValue: '')
  final String? folderPath;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Products$Item$Category$Photo$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Products$Item$Category$Photo$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Products$Item$Category$Photo$Localizations$Item>?
  localizations;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$PhotoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$Photo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(
                  other.related,
                  related,
                )) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.folderPath, folderPath) ||
                const DeepCollectionEquality().equals(
                  other.folderPath,
                  folderPath,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(folderPath) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$PhotoExtension
    on Category$Products$Item$Category$Photo {
  Category$Products$Item$Category$Photo copyWith({
    double? id,
    String? documentId,
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    dynamic formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    dynamic providerMetadata,
    List<Category$Products$Item$Category$Photo$Related$Item>? related,
    Category$Products$Item$Category$Photo$Folder? folder,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Products$Item$Category$Photo$CreatedBy? createdBy,
    Category$Products$Item$Category$Photo$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Products$Item$Category$Photo$Localizations$Item>?
    localizations,
  }) {
    return Category$Products$Item$Category$Photo(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      related: related ?? this.related,
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Products$Item$Category$Photo copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<int?>? width,
    Wrapped<int?>? height,
    Wrapped<dynamic>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<dynamic>? providerMetadata,
    Wrapped<List<Category$Products$Item$Category$Photo$Related$Item>?>? related,
    Wrapped<Category$Products$Item$Category$Photo$Folder?>? folder,
    Wrapped<String?>? folderPath,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Products$Item$Category$Photo$CreatedBy?>? createdBy,
    Wrapped<Category$Products$Item$Category$Photo$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Category$Products$Item$Category$Photo$Localizations$Item>?>?
    localizations,
  }) {
    return Category$Products$Item$Category$Photo(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      related: (related != null ? related.value : this.related),
      folder: (folder != null ? folder.value : this.folder),
      folderPath: (folderPath != null ? folderPath.value : this.folderPath),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$Products$Item {
  const Category$Products$Item$Category$Products$Item({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Category$Products$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$Products$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$Products$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$Products$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$Products$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$Products$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$Products$ItemExtension
    on Category$Products$Item$Category$Products$Item {
  Category$Products$Item$Category$Products$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$Products$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$Products$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$Products$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$CreatedBy {
  const Category$Products$Item$Category$CreatedBy({this.id, this.documentId});

  factory Category$Products$Item$Category$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$CreatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$CreatedByExtension
    on Category$Products$Item$Category$CreatedBy {
  Category$Products$Item$Category$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$UpdatedBy {
  const Category$Products$Item$Category$UpdatedBy({this.id, this.documentId});

  factory Category$Products$Item$Category$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$UpdatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$UpdatedByExtension
    on Category$Products$Item$Category$UpdatedBy {
  Category$Products$Item$Category$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$Localizations$Item {
  const Category$Products$Item$Category$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Category$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$Localizations$ItemExtension
    on Category$Products$Item$Category$Localizations$Item {
  Category$Products$Item$Category$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Parent {
  const Product$Photo$Item$Folder$Parent({this.id, this.documentId});

  factory Product$Photo$Item$Folder$Parent.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$ParentFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$Folder$ParentToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$ParentToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Photo$Item$Folder$ParentFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Parent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$ParentExtension
    on Product$Photo$Item$Folder$Parent {
  Product$Photo$Item$Folder$Parent copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$Folder$Parent(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Parent copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Parent(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Children$Item {
  const Product$Photo$Item$Folder$Children$Item({this.id, this.documentId});

  factory Product$Photo$Item$Folder$Children$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Children$ItemFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$Folder$Children$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Children$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Children$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Children$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Children$ItemExtension
    on Product$Photo$Item$Folder$Children$Item {
  Product$Photo$Item$Folder$Children$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Children$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Children$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Children$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item {
  const Product$Photo$Item$Folder$Files$Item({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.related,
    this.folder,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Photo$Item$Folder$Files$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Files$ItemFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$Folder$Files$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final dynamic formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final dynamic providerMetadata;
  @JsonKey(name: 'related', includeIfNull: false)
  final List<Product$Photo$Item$Folder$Files$Item$Related$Item>? related;
  @JsonKey(name: 'folder', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$Folder? folder;
  @JsonKey(name: 'folderPath', includeIfNull: false, defaultValue: '')
  final String? folderPath;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Photo$Item$Folder$Files$Item$Localizations$Item>?
  localizations;
  static const fromJsonFactory = _$Product$Photo$Item$Folder$Files$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(
                  other.related,
                  related,
                )) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.folderPath, folderPath) ||
                const DeepCollectionEquality().equals(
                  other.folderPath,
                  folderPath,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(folderPath) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$ItemExtension
    on Product$Photo$Item$Folder$Files$Item {
  Product$Photo$Item$Folder$Files$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    dynamic formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    dynamic providerMetadata,
    List<Product$Photo$Item$Folder$Files$Item$Related$Item>? related,
    Product$Photo$Item$Folder$Files$Item$Folder? folder,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Photo$Item$Folder$Files$Item$CreatedBy? createdBy,
    Product$Photo$Item$Folder$Files$Item$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Photo$Item$Folder$Files$Item$Localizations$Item>?
    localizations,
  }) {
    return Product$Photo$Item$Folder$Files$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      related: related ?? this.related,
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Photo$Item$Folder$Files$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<int?>? width,
    Wrapped<int?>? height,
    Wrapped<dynamic>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<dynamic>? providerMetadata,
    Wrapped<List<Product$Photo$Item$Folder$Files$Item$Related$Item>?>? related,
    Wrapped<Product$Photo$Item$Folder$Files$Item$Folder?>? folder,
    Wrapped<String?>? folderPath,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$Photo$Item$Folder$Files$Item$CreatedBy?>? createdBy,
    Wrapped<Product$Photo$Item$Folder$Files$Item$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<List<Product$Photo$Item$Folder$Files$Item$Localizations$Item>?>?
    localizations,
  }) {
    return Product$Photo$Item$Folder$Files$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      related: (related != null ? related.value : this.related),
      folder: (folder != null ? folder.value : this.folder),
      folderPath: (folderPath != null ? folderPath.value : this.folderPath),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$CreatedBy {
  const Product$Photo$Item$Folder$CreatedBy({this.id, this.documentId});

  factory Product$Photo$Item$Folder$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$CreatedByFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$Folder$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Photo$Item$Folder$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$CreatedByExtension
    on Product$Photo$Item$Folder$CreatedBy {
  Product$Photo$Item$Folder$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$UpdatedBy {
  const Product$Photo$Item$Folder$UpdatedBy({this.id, this.documentId});

  factory Product$Photo$Item$Folder$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$UpdatedByFromJson(json);

  static const toJsonFactory = _$Product$Photo$Item$Folder$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Photo$Item$Folder$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$UpdatedByExtension
    on Product$Photo$Item$Folder$UpdatedBy {
  Product$Photo$Item$Folder$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Localizations$Item {
  const Product$Photo$Item$Folder$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Localizations$ItemExtension
    on Product$Photo$Item$Folder$Localizations$Item {
  Product$Photo$Item$Folder$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Photo$Related$Item {
  const Product$Category$Photo$Related$Item({this.id, this.documentId});

  factory Product$Category$Photo$Related$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Photo$Related$ItemFromJson(json);

  static const toJsonFactory = _$Product$Category$Photo$Related$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Photo$Related$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Category$Photo$Related$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Photo$Related$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Photo$Related$ItemExtension
    on Product$Category$Photo$Related$Item {
  Product$Category$Photo$Related$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Photo$Related$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Photo$Related$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Photo$Related$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Photo$Folder {
  const Product$Category$Photo$Folder({this.id, this.documentId});

  factory Product$Category$Photo$Folder.fromJson(Map<String, dynamic> json) =>
      _$Product$Category$Photo$FolderFromJson(json);

  static const toJsonFactory = _$Product$Category$Photo$FolderToJson;
  Map<String, dynamic> toJson() => _$Product$Category$Photo$FolderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Category$Photo$FolderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Photo$Folder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Photo$FolderExtension
    on Product$Category$Photo$Folder {
  Product$Category$Photo$Folder copyWith({double? id, String? documentId}) {
    return Product$Category$Photo$Folder(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Photo$Folder copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Photo$Folder(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Photo$CreatedBy {
  const Product$Category$Photo$CreatedBy({this.id, this.documentId});

  factory Product$Category$Photo$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Photo$CreatedByFromJson(json);

  static const toJsonFactory = _$Product$Category$Photo$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Photo$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Category$Photo$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Photo$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Photo$CreatedByExtension
    on Product$Category$Photo$CreatedBy {
  Product$Category$Photo$CreatedBy copyWith({double? id, String? documentId}) {
    return Product$Category$Photo$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Photo$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Photo$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Photo$UpdatedBy {
  const Product$Category$Photo$UpdatedBy({this.id, this.documentId});

  factory Product$Category$Photo$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Photo$UpdatedByFromJson(json);

  static const toJsonFactory = _$Product$Category$Photo$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Photo$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory = _$Product$Category$Photo$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Photo$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Photo$UpdatedByExtension
    on Product$Category$Photo$UpdatedBy {
  Product$Category$Photo$UpdatedBy copyWith({double? id, String? documentId}) {
    return Product$Category$Photo$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Photo$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Photo$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Photo$Localizations$Item {
  const Product$Category$Photo$Localizations$Item({this.id, this.documentId});

  factory Product$Category$Photo$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Photo$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Product$Category$Photo$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Photo$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Photo$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Photo$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Photo$Localizations$ItemExtension
    on Product$Category$Photo$Localizations$Item {
  Product$Category$Photo$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Photo$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Photo$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Photo$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$Photo$Item {
  const Product$Category$Products$Item$Photo$Item({
    this.id,
    this.documentId,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.related,
    this.folder,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Category$Products$Item$Photo$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$Photo$ItemFromJson(json);

  static const toJsonFactory =
      _$Product$Category$Products$Item$Photo$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$Photo$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'alternativeText', includeIfNull: false, defaultValue: '')
  final String? alternativeText;
  @JsonKey(name: 'caption', includeIfNull: false, defaultValue: '')
  final String? caption;
  @JsonKey(name: 'width', includeIfNull: false)
  final int? width;
  @JsonKey(name: 'height', includeIfNull: false)
  final int? height;
  @JsonKey(name: 'formats', includeIfNull: false)
  final dynamic formats;
  @JsonKey(name: 'hash', includeIfNull: false, defaultValue: '')
  final String? hash;
  @JsonKey(name: 'ext', includeIfNull: false, defaultValue: '')
  final String? ext;
  @JsonKey(name: 'mime', includeIfNull: false, defaultValue: '')
  final String? mime;
  @JsonKey(name: 'size', includeIfNull: false)
  final double? size;
  @JsonKey(name: 'url', includeIfNull: false, defaultValue: '')
  final String? url;
  @JsonKey(name: 'previewUrl', includeIfNull: false, defaultValue: '')
  final String? previewUrl;
  @JsonKey(name: 'provider', includeIfNull: false, defaultValue: '')
  final String? provider;
  @JsonKey(name: 'provider_metadata', includeIfNull: false)
  final dynamic providerMetadata;
  @JsonKey(name: 'related', includeIfNull: false)
  final List<Product$Category$Products$Item$Photo$Item$Related$Item>? related;
  @JsonKey(name: 'folder', includeIfNull: false)
  final Product$Category$Products$Item$Photo$Item$Folder? folder;
  @JsonKey(name: 'folderPath', includeIfNull: false, defaultValue: '')
  final String? folderPath;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Category$Products$Item$Photo$Item$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Category$Products$Item$Photo$Item$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Category$Products$Item$Photo$Item$Localizations$Item>?
  localizations;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$Photo$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$Photo$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality().equals(
                  other.alternativeText,
                  alternativeText,
                )) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(
                  other.caption,
                  caption,
                )) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(
                  other.formats,
                  formats,
                )) &&
            (identical(other.hash, hash) ||
                const DeepCollectionEquality().equals(other.hash, hash)) &&
            (identical(other.ext, ext) ||
                const DeepCollectionEquality().equals(other.ext, ext)) &&
            (identical(other.mime, mime) ||
                const DeepCollectionEquality().equals(other.mime, mime)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.previewUrl, previewUrl) ||
                const DeepCollectionEquality().equals(
                  other.previewUrl,
                  previewUrl,
                )) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality().equals(
                  other.provider,
                  provider,
                )) &&
            (identical(other.providerMetadata, providerMetadata) ||
                const DeepCollectionEquality().equals(
                  other.providerMetadata,
                  providerMetadata,
                )) &&
            (identical(other.related, related) ||
                const DeepCollectionEquality().equals(
                  other.related,
                  related,
                )) &&
            (identical(other.folder, folder) ||
                const DeepCollectionEquality().equals(other.folder, folder)) &&
            (identical(other.folderPath, folderPath) ||
                const DeepCollectionEquality().equals(
                  other.folderPath,
                  folderPath,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(formats) ^
      const DeepCollectionEquality().hash(hash) ^
      const DeepCollectionEquality().hash(ext) ^
      const DeepCollectionEquality().hash(mime) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(previewUrl) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(providerMetadata) ^
      const DeepCollectionEquality().hash(related) ^
      const DeepCollectionEquality().hash(folder) ^
      const DeepCollectionEquality().hash(folderPath) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$Photo$ItemExtension
    on Product$Category$Products$Item$Photo$Item {
  Product$Category$Products$Item$Photo$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    dynamic formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    dynamic providerMetadata,
    List<Product$Category$Products$Item$Photo$Item$Related$Item>? related,
    Product$Category$Products$Item$Photo$Item$Folder? folder,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Category$Products$Item$Photo$Item$CreatedBy? createdBy,
    Product$Category$Products$Item$Photo$Item$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Category$Products$Item$Photo$Item$Localizations$Item>?
    localizations,
  }) {
    return Product$Category$Products$Item$Photo$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      related: related ?? this.related,
      folder: folder ?? this.folder,
      folderPath: folderPath ?? this.folderPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Category$Products$Item$Photo$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? alternativeText,
    Wrapped<String?>? caption,
    Wrapped<int?>? width,
    Wrapped<int?>? height,
    Wrapped<dynamic>? formats,
    Wrapped<String?>? hash,
    Wrapped<String?>? ext,
    Wrapped<String?>? mime,
    Wrapped<double?>? size,
    Wrapped<String?>? url,
    Wrapped<String?>? previewUrl,
    Wrapped<String?>? provider,
    Wrapped<dynamic>? providerMetadata,
    Wrapped<List<Product$Category$Products$Item$Photo$Item$Related$Item>?>?
    related,
    Wrapped<Product$Category$Products$Item$Photo$Item$Folder?>? folder,
    Wrapped<String?>? folderPath,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$Category$Products$Item$Photo$Item$CreatedBy?>? createdBy,
    Wrapped<Product$Category$Products$Item$Photo$Item$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<
      List<Product$Category$Products$Item$Photo$Item$Localizations$Item>?
    >?
    localizations,
  }) {
    return Product$Category$Products$Item$Photo$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      alternativeText: (alternativeText != null
          ? alternativeText.value
          : this.alternativeText),
      caption: (caption != null ? caption.value : this.caption),
      width: (width != null ? width.value : this.width),
      height: (height != null ? height.value : this.height),
      formats: (formats != null ? formats.value : this.formats),
      hash: (hash != null ? hash.value : this.hash),
      ext: (ext != null ? ext.value : this.ext),
      mime: (mime != null ? mime.value : this.mime),
      size: (size != null ? size.value : this.size),
      url: (url != null ? url.value : this.url),
      previewUrl: (previewUrl != null ? previewUrl.value : this.previewUrl),
      provider: (provider != null ? provider.value : this.provider),
      providerMetadata: (providerMetadata != null
          ? providerMetadata.value
          : this.providerMetadata),
      related: (related != null ? related.value : this.related),
      folder: (folder != null ? folder.value : this.folder),
      folderPath: (folderPath != null ? folderPath.value : this.folderPath),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$Category {
  const Product$Category$Products$Item$Category({this.id, this.documentId});

  factory Product$Category$Products$Item$Category.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$CategoryFromJson(json);

  static const toJsonFactory = _$Product$Category$Products$Item$CategoryToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$CategoryToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$CategoryFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$Category &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$CategoryExtension
    on Product$Category$Products$Item$Category {
  Product$Category$Products$Item$Category copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$Category(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$Category copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$Category(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$CreatedBy {
  const Product$Category$Products$Item$CreatedBy({this.id, this.documentId});

  factory Product$Category$Products$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$CreatedByFromJson(json);

  static const toJsonFactory = _$Product$Category$Products$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$CreatedByExtension
    on Product$Category$Products$Item$CreatedBy {
  Product$Category$Products$Item$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$UpdatedBy {
  const Product$Category$Products$Item$UpdatedBy({this.id, this.documentId});

  factory Product$Category$Products$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$UpdatedByFromJson(json);

  static const toJsonFactory = _$Product$Category$Products$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$UpdatedByExtension
    on Product$Category$Products$Item$UpdatedBy {
  Product$Category$Products$Item$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$Localizations$Item {
  const Product$Category$Products$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Product$Category$Products$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Product$Category$Products$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$Localizations$ItemExtension
    on Product$Category$Products$Item$Localizations$Item {
  Product$Category$Products$Item$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$Related$Item {
  const Category$Photo$Folder$Files$Item$Related$Item({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$Related$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$Related$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$Related$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$Related$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$Related$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item$Related$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$Related$ItemExtension
    on Category$Photo$Folder$Files$Item$Related$Item {
  Category$Photo$Folder$Files$Item$Related$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$Related$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$Related$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$Related$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$Folder {
  const Category$Photo$Folder$Files$Item$Folder({this.id, this.documentId});

  factory Category$Photo$Folder$Files$Item$Folder.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$FolderFromJson(json);

  static const toJsonFactory = _$Category$Photo$Folder$Files$Item$FolderToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$FolderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$FolderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item$Folder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$FolderExtension
    on Category$Photo$Folder$Files$Item$Folder {
  Category$Photo$Folder$Files$Item$Folder copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$Folder(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$Folder copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$Folder(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy {
  const Category$Photo$Folder$Files$Item$CreatedBy({
    this.id,
    this.documentId,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.resetPasswordToken,
    this.registrationToken,
    this.isActive,
    this.roles,
    this.blocked,
    this.preferedLanguage,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$CreatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'firstname', includeIfNull: false, defaultValue: '')
  final String? firstname;
  @JsonKey(name: 'lastname', includeIfNull: false, defaultValue: '')
  final String? lastname;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'resetPasswordToken', includeIfNull: false, defaultValue: '')
  final String? resetPasswordToken;
  @JsonKey(name: 'registrationToken', includeIfNull: false, defaultValue: '')
  final String? registrationToken;
  @JsonKey(name: 'isActive', includeIfNull: false)
  final bool? isActive;
  @JsonKey(name: 'roles', includeIfNull: false)
  final List<Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item>? roles;
  @JsonKey(name: 'blocked', includeIfNull: false)
  final bool? blocked;
  @JsonKey(name: 'preferedLanguage', includeIfNull: false, defaultValue: '')
  final String? preferedLanguage;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item>?
  localizations;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality().equals(
                  other.firstname,
                  firstname,
                )) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality().equals(
                  other.lastname,
                  lastname,
                )) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.resetPasswordToken, resetPasswordToken) ||
                const DeepCollectionEquality().equals(
                  other.resetPasswordToken,
                  resetPasswordToken,
                )) &&
            (identical(other.registrationToken, registrationToken) ||
                const DeepCollectionEquality().equals(
                  other.registrationToken,
                  registrationToken,
                )) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality().equals(
                  other.isActive,
                  isActive,
                )) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.blocked, blocked) ||
                const DeepCollectionEquality().equals(
                  other.blocked,
                  blocked,
                )) &&
            (identical(other.preferedLanguage, preferedLanguage) ||
                const DeepCollectionEquality().equals(
                  other.preferedLanguage,
                  preferedLanguage,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(resetPasswordToken) ^
      const DeepCollectionEquality().hash(registrationToken) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(blocked) ^
      const DeepCollectionEquality().hash(preferedLanguage) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedByExtension
    on Category$Photo$Folder$Files$Item$CreatedBy {
  Category$Photo$Folder$Files$Item$CreatedBy copyWith({
    double? id,
    String? documentId,
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    String? resetPasswordToken,
    String? registrationToken,
    bool? isActive,
    List<Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item>? roles,
    bool? blocked,
    String? preferedLanguage,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy? createdBy,
    Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy? updatedBy,
    String? locale,
    List<Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item>?
    localizations,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      username: username ?? this.username,
      email: email ?? this.email,
      resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
      registrationToken: registrationToken ?? this.registrationToken,
      isActive: isActive ?? this.isActive,
      roles: roles ?? this.roles,
      blocked: blocked ?? this.blocked,
      preferedLanguage: preferedLanguage ?? this.preferedLanguage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? firstname,
    Wrapped<String?>? lastname,
    Wrapped<String?>? username,
    Wrapped<String?>? email,
    Wrapped<String?>? resetPasswordToken,
    Wrapped<String?>? registrationToken,
    Wrapped<bool?>? isActive,
    Wrapped<List<Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item>?>?
    roles,
    Wrapped<bool?>? blocked,
    Wrapped<String?>? preferedLanguage,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy?>? createdBy,
    Wrapped<Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy?>? updatedBy,
    Wrapped<String?>? locale,
    Wrapped<
      List<Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item>?
    >?
    localizations,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      firstname: (firstname != null ? firstname.value : this.firstname),
      lastname: (lastname != null ? lastname.value : this.lastname),
      username: (username != null ? username.value : this.username),
      email: (email != null ? email.value : this.email),
      resetPasswordToken: (resetPasswordToken != null
          ? resetPasswordToken.value
          : this.resetPasswordToken),
      registrationToken: (registrationToken != null
          ? registrationToken.value
          : this.registrationToken),
      isActive: (isActive != null ? isActive.value : this.isActive),
      roles: (roles != null ? roles.value : this.roles),
      blocked: (blocked != null ? blocked.value : this.blocked),
      preferedLanguage: (preferedLanguage != null
          ? preferedLanguage.value
          : this.preferedLanguage),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$UpdatedBy {
  const Category$Photo$Folder$Files$Item$UpdatedBy({this.id, this.documentId});

  factory Category$Photo$Folder$Files$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$UpdatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$UpdatedByExtension
    on Category$Photo$Folder$Files$Item$UpdatedBy {
  Category$Photo$Folder$Files$Item$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$Localizations$Item {
  const Category$Photo$Folder$Files$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$Localizations$ItemExtension
    on Category$Photo$Folder$Files$Item$Localizations$Item {
  Category$Photo$Folder$Files$Item$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$Photo$Related$Item {
  const Category$Products$Item$Category$Photo$Related$Item({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Category$Photo$Related$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$Photo$Related$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$Photo$Related$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$Photo$Related$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$Photo$Related$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$Photo$Related$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$Photo$Related$ItemExtension
    on Category$Products$Item$Category$Photo$Related$Item {
  Category$Products$Item$Category$Photo$Related$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$Photo$Related$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$Photo$Related$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$Photo$Related$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$Photo$Folder {
  const Category$Products$Item$Category$Photo$Folder({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Category$Photo$Folder.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$Photo$FolderFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$Photo$FolderToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$Photo$FolderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$Photo$FolderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$Photo$Folder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$Photo$FolderExtension
    on Category$Products$Item$Category$Photo$Folder {
  Category$Products$Item$Category$Photo$Folder copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$Photo$Folder(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$Photo$Folder copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$Photo$Folder(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$Photo$CreatedBy {
  const Category$Products$Item$Category$Photo$CreatedBy({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Category$Photo$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$Photo$CreatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$Photo$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$Photo$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$Photo$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$Photo$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$Photo$CreatedByExtension
    on Category$Products$Item$Category$Photo$CreatedBy {
  Category$Products$Item$Category$Photo$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$Photo$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$Photo$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$Photo$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$Photo$UpdatedBy {
  const Category$Products$Item$Category$Photo$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Category$Photo$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$Photo$UpdatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$Photo$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$Photo$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$Photo$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$Photo$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$Photo$UpdatedByExtension
    on Category$Products$Item$Category$Photo$UpdatedBy {
  Category$Products$Item$Category$Photo$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$Photo$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$Photo$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$Photo$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Products$Item$Category$Photo$Localizations$Item {
  const Category$Products$Item$Category$Photo$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Category$Products$Item$Category$Photo$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Products$Item$Category$Photo$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Products$Item$Category$Photo$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Products$Item$Category$Photo$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Products$Item$Category$Photo$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Products$Item$Category$Photo$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Products$Item$Category$Photo$Localizations$ItemExtension
    on Category$Products$Item$Category$Photo$Localizations$Item {
  Category$Products$Item$Category$Photo$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Products$Item$Category$Photo$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Products$Item$Category$Photo$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Products$Item$Category$Photo$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$Related$Item {
  const Product$Photo$Item$Folder$Files$Item$Related$Item({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$Related$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Files$Item$Related$ItemFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$Related$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$Related$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$Related$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item$Related$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$Related$ItemExtension
    on Product$Photo$Item$Folder$Files$Item$Related$Item {
  Product$Photo$Item$Folder$Files$Item$Related$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$Related$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$Related$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$Related$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$Folder {
  const Product$Photo$Item$Folder$Files$Item$Folder({this.id, this.documentId});

  factory Product$Photo$Item$Folder$Files$Item$Folder.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Files$Item$FolderFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$FolderToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$FolderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$FolderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item$Folder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$FolderExtension
    on Product$Photo$Item$Folder$Files$Item$Folder {
  Product$Photo$Item$Folder$Files$Item$Folder copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$Folder(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$Folder copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$Folder(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy({
    this.id,
    this.documentId,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.resetPasswordToken,
    this.registrationToken,
    this.isActive,
    this.roles,
    this.blocked,
    this.preferedLanguage,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Files$Item$CreatedByFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'firstname', includeIfNull: false, defaultValue: '')
  final String? firstname;
  @JsonKey(name: 'lastname', includeIfNull: false, defaultValue: '')
  final String? lastname;
  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  @JsonKey(name: 'email', includeIfNull: false, defaultValue: '')
  final String? email;
  @JsonKey(name: 'resetPasswordToken', includeIfNull: false, defaultValue: '')
  final String? resetPasswordToken;
  @JsonKey(name: 'registrationToken', includeIfNull: false, defaultValue: '')
  final String? registrationToken;
  @JsonKey(name: 'isActive', includeIfNull: false)
  final bool? isActive;
  @JsonKey(name: 'roles', includeIfNull: false)
  final List<Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item>? roles;
  @JsonKey(name: 'blocked', includeIfNull: false)
  final bool? blocked;
  @JsonKey(name: 'preferedLanguage', includeIfNull: false, defaultValue: '')
  final String? preferedLanguage;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy? createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy? updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item>?
  localizations;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality().equals(
                  other.firstname,
                  firstname,
                )) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality().equals(
                  other.lastname,
                  lastname,
                )) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality().equals(
                  other.username,
                  username,
                )) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.resetPasswordToken, resetPasswordToken) ||
                const DeepCollectionEquality().equals(
                  other.resetPasswordToken,
                  resetPasswordToken,
                )) &&
            (identical(other.registrationToken, registrationToken) ||
                const DeepCollectionEquality().equals(
                  other.registrationToken,
                  registrationToken,
                )) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality().equals(
                  other.isActive,
                  isActive,
                )) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.blocked, blocked) ||
                const DeepCollectionEquality().equals(
                  other.blocked,
                  blocked,
                )) &&
            (identical(other.preferedLanguage, preferedLanguage) ||
                const DeepCollectionEquality().equals(
                  other.preferedLanguage,
                  preferedLanguage,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(resetPasswordToken) ^
      const DeepCollectionEquality().hash(registrationToken) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(blocked) ^
      const DeepCollectionEquality().hash(preferedLanguage) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedByExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy {
  Product$Photo$Item$Folder$Files$Item$CreatedBy copyWith({
    double? id,
    String? documentId,
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    String? resetPasswordToken,
    String? registrationToken,
    bool? isActive,
    List<Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item>? roles,
    bool? blocked,
    String? preferedLanguage,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy? createdBy,
    Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy? updatedBy,
    String? locale,
    List<Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item>?
    localizations,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      username: username ?? this.username,
      email: email ?? this.email,
      resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
      registrationToken: registrationToken ?? this.registrationToken,
      isActive: isActive ?? this.isActive,
      roles: roles ?? this.roles,
      blocked: blocked ?? this.blocked,
      preferedLanguage: preferedLanguage ?? this.preferedLanguage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? firstname,
    Wrapped<String?>? lastname,
    Wrapped<String?>? username,
    Wrapped<String?>? email,
    Wrapped<String?>? resetPasswordToken,
    Wrapped<String?>? registrationToken,
    Wrapped<bool?>? isActive,
    Wrapped<List<Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item>?>?
    roles,
    Wrapped<bool?>? blocked,
    Wrapped<String?>? preferedLanguage,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy?>?
    createdBy,
    Wrapped<Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy?>?
    updatedBy,
    Wrapped<String?>? locale,
    Wrapped<
      List<Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item>?
    >?
    localizations,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      firstname: (firstname != null ? firstname.value : this.firstname),
      lastname: (lastname != null ? lastname.value : this.lastname),
      username: (username != null ? username.value : this.username),
      email: (email != null ? email.value : this.email),
      resetPasswordToken: (resetPasswordToken != null
          ? resetPasswordToken.value
          : this.resetPasswordToken),
      registrationToken: (registrationToken != null
          ? registrationToken.value
          : this.registrationToken),
      isActive: (isActive != null ? isActive.value : this.isActive),
      roles: (roles != null ? roles.value : this.roles),
      blocked: (blocked != null ? blocked.value : this.blocked),
      preferedLanguage: (preferedLanguage != null
          ? preferedLanguage.value
          : this.preferedLanguage),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$UpdatedBy {
  const Product$Photo$Item$Folder$Files$Item$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Files$Item$UpdatedByFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$UpdatedByExtension
    on Product$Photo$Item$Folder$Files$Item$UpdatedBy {
  Product$Photo$Item$Folder$Files$Item$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$Localizations$Item {
  const Product$Photo$Item$Folder$Files$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Files$Item$Localizations$ItemFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$Localizations$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$Localizations$ItemExtension
    on Product$Photo$Item$Folder$Files$Item$Localizations$Item {
  Product$Photo$Item$Folder$Files$Item$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$Photo$Item$Related$Item {
  const Product$Category$Products$Item$Photo$Item$Related$Item({
    this.id,
    this.documentId,
  });

  factory Product$Category$Products$Item$Photo$Item$Related$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$Photo$Item$Related$ItemFromJson(json);

  static const toJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$Related$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$Photo$Item$Related$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$Related$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$Photo$Item$Related$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$Photo$Item$Related$ItemExtension
    on Product$Category$Products$Item$Photo$Item$Related$Item {
  Product$Category$Products$Item$Photo$Item$Related$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$Related$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$Photo$Item$Related$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$Related$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$Photo$Item$Folder {
  const Product$Category$Products$Item$Photo$Item$Folder({
    this.id,
    this.documentId,
  });

  factory Product$Category$Products$Item$Photo$Item$Folder.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$Photo$Item$FolderFromJson(json);

  static const toJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$FolderToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$Photo$Item$FolderToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$FolderFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$Photo$Item$Folder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$Photo$Item$FolderExtension
    on Product$Category$Products$Item$Photo$Item$Folder {
  Product$Category$Products$Item$Photo$Item$Folder copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$Folder(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$Photo$Item$Folder copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$Folder(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$Photo$Item$CreatedBy {
  const Product$Category$Products$Item$Photo$Item$CreatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Category$Products$Item$Photo$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$Photo$Item$CreatedByFromJson(json);

  static const toJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$Photo$Item$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$Photo$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$Photo$Item$CreatedByExtension
    on Product$Category$Products$Item$Photo$Item$CreatedBy {
  Product$Category$Products$Item$Photo$Item$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$Photo$Item$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$Photo$Item$UpdatedBy {
  const Product$Category$Products$Item$Photo$Item$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Category$Products$Item$Photo$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$Photo$Item$UpdatedByFromJson(json);

  static const toJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$Photo$Item$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Category$Products$Item$Photo$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$Photo$Item$UpdatedByExtension
    on Product$Category$Products$Item$Photo$Item$UpdatedBy {
  Product$Category$Products$Item$Photo$Item$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$Photo$Item$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Category$Products$Item$Photo$Item$Localizations$Item {
  const Product$Category$Products$Item$Photo$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Product$Category$Products$Item$Photo$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Category$Products$Item$Photo$Item$Localizations$ItemFromJson(
    json,
  );

  static const toJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Category$Products$Item$Photo$Item$Localizations$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Category$Products$Item$Photo$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Category$Products$Item$Photo$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Category$Products$Item$Photo$Item$Localizations$ItemExtension
    on Product$Category$Products$Item$Photo$Item$Localizations$Item {
  Product$Category$Products$Item$Photo$Item$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Category$Products$Item$Photo$Item$Localizations$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Category$Products$Item$Photo$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item({
    this.id,
    this.documentId,
    this.name,
    this.code,
    this.description,
    this.users,
    this.permissions,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$ItemFromJson(json);

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'code', includeIfNull: false, defaultValue: '')
  final String? code;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'users', includeIfNull: false)
  final List<Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item>?
  users;
  @JsonKey(name: 'permissions', includeIfNull: false)
  final List<
    Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
  >?
  permissions;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy?
  createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy?
  updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<
    Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
  >?
  localizations;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.permissions, permissions) ||
                const DeepCollectionEquality().equals(
                  other.permissions,
                  permissions,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(permissions) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$ItemExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? code,
    String? description,
    List<Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item>?
    users,
    List<
      Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
    >?
    permissions,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy? createdBy,
    Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy? updatedBy,
    String? locale,
    List<
      Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
    >?
    localizations,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      users: users ?? this.users,
      permissions: permissions ?? this.permissions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? code,
    Wrapped<String?>? description,
    Wrapped<
      List<Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item>?
    >?
    users,
    Wrapped<
      List<
        Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
      >?
    >?
    permissions,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy?>?
    createdBy,
    Wrapped<Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy?>?
    updatedBy,
    Wrapped<String?>? locale,
    Wrapped<
      List<
        Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
      >?
    >?
    localizations,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      code: (code != null ? code.value : this.code),
      description: (description != null ? description.value : this.description),
      users: (users != null ? users.value : this.users),
      permissions: (permissions != null ? permissions.value : this.permissions),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy {
  const Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$CreatedBy$CreatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$CreatedByExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy {
  Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy {
  const Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$CreatedBy$UpdatedByFromJson(json);

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$UpdatedByExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy {
  Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item {
  const Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) => _$Category$Photo$Folder$Files$Item$CreatedBy$Localizations$ItemFromJson(
    json,
  );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Localizations$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Localizations$ItemExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item {
  Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item({
    this.id,
    this.documentId,
    this.name,
    this.code,
    this.description,
    this.users,
    this.permissions,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$ItemFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$ItemToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'code', includeIfNull: false, defaultValue: '')
  final String? code;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'users', includeIfNull: false)
  final List<
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item
  >?
  users;
  @JsonKey(name: 'permissions', includeIfNull: false)
  final List<
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
  >?
  permissions;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy?
  createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy?
  updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
  >?
  localizations;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality().equals(
                  other.description,
                  description,
                )) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.permissions, permissions) ||
                const DeepCollectionEquality().equals(
                  other.permissions,
                  permissions,
                )) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(permissions) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$ItemExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item copyWith({
    double? id,
    String? documentId,
    String? name,
    String? code,
    String? description,
    List<Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item>?
    users,
    List<
      Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
    >?
    permissions,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy?
    createdBy,
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy?
    updatedBy,
    String? locale,
    List<
      Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
    >?
    localizations,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      users: users ?? this.users,
      permissions: permissions ?? this.permissions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? name,
    Wrapped<String?>? code,
    Wrapped<String?>? description,
    Wrapped<
      List<
        Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item
      >?
    >?
    users,
    Wrapped<
      List<
        Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
      >?
    >?
    permissions,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<
      Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy?
    >?
    createdBy,
    Wrapped<
      Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy?
    >?
    updatedBy,
    Wrapped<String?>? locale,
    Wrapped<
      List<
        Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
      >?
    >?
    localizations,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      name: (name != null ? name.value : this.name),
      code: (code != null ? code.value : this.code),
      description: (description != null ? description.value : this.description),
      users: (users != null ? users.value : this.users),
      permissions: (permissions != null ? permissions.value : this.permissions),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedByFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedByExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) => _$Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedByFromJson(json);

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedByToJson(this);

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedByExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$ItemExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item({
    this.id,
    this.documentId,
    this.action,
    this.actionParameters,
    this.subject,
    this.properties,
    this.conditions,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'action', includeIfNull: false, defaultValue: '')
  final String? action;
  @JsonKey(name: 'actionParameters', includeIfNull: false)
  final dynamic actionParameters;
  @JsonKey(name: 'subject', includeIfNull: false, defaultValue: '')
  final String? subject;
  @JsonKey(name: 'properties', includeIfNull: false)
  final dynamic properties;
  @JsonKey(name: 'conditions', includeIfNull: false)
  final dynamic conditions;
  @JsonKey(name: 'role', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role?
  role;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy?
  createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy?
  updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<
    Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
  >?
  localizations;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)) &&
            (identical(other.actionParameters, actionParameters) ||
                const DeepCollectionEquality().equals(
                  other.actionParameters,
                  actionParameters,
                )) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality().equals(
                  other.subject,
                  subject,
                )) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality().equals(
                  other.properties,
                  properties,
                )) &&
            (identical(other.conditions, conditions) ||
                const DeepCollectionEquality().equals(
                  other.conditions,
                  conditions,
                )) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(action) ^
      const DeepCollectionEquality().hash(actionParameters) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(conditions) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
  copyWith({
    double? id,
    String? documentId,
    String? action,
    dynamic actionParameters,
    String? subject,
    dynamic properties,
    dynamic conditions,
    Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role?
    role,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy?
    createdBy,
    Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy?
    updatedBy,
    String? locale,
    List<
      Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
    >?
    localizations,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      action: action ?? this.action,
      actionParameters: actionParameters ?? this.actionParameters,
      subject: subject ?? this.subject,
      properties: properties ?? this.properties,
      conditions: conditions ?? this.conditions,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
  copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? action,
    Wrapped<dynamic>? actionParameters,
    Wrapped<String?>? subject,
    Wrapped<dynamic>? properties,
    Wrapped<dynamic>? conditions,
    Wrapped<
      Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role?
    >?
    role,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<
      Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy?
    >?
    createdBy,
    Wrapped<
      Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy?
    >?
    updatedBy,
    Wrapped<String?>? locale,
    Wrapped<
      List<
        Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
      >?
    >?
    localizations,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      action: (action != null ? action.value : this.action),
      actionParameters: (actionParameters != null
          ? actionParameters.value
          : this.actionParameters),
      subject: (subject != null ? subject.value : this.subject),
      properties: (properties != null ? properties.value : this.properties),
      conditions: (conditions != null ? conditions.value : this.conditions),
      role: (role != null ? role.value : this.role),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
  copyWith({double? id, String? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$ItemExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item
  copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Users$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item({
    this.id,
    this.documentId,
    this.action,
    this.actionParameters,
    this.subject,
    this.properties,
    this.conditions,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
    this.locale,
    this.localizations,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  @JsonKey(name: 'action', includeIfNull: false, defaultValue: '')
  final String? action;
  @JsonKey(name: 'actionParameters', includeIfNull: false)
  final dynamic actionParameters;
  @JsonKey(name: 'subject', includeIfNull: false, defaultValue: '')
  final String? subject;
  @JsonKey(name: 'properties', includeIfNull: false)
  final dynamic properties;
  @JsonKey(name: 'conditions', includeIfNull: false)
  final dynamic conditions;
  @JsonKey(name: 'role', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role?
  role;
  @JsonKey(name: 'createdAt', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'publishedAt', includeIfNull: false)
  final DateTime? publishedAt;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy?
  createdBy;
  @JsonKey(name: 'updatedBy', includeIfNull: false)
  final Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy?
  updatedBy;
  @JsonKey(name: 'locale', includeIfNull: false, defaultValue: '')
  final String? locale;
  @JsonKey(name: 'localizations', includeIfNull: false)
  final List<
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
  >?
  localizations;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )) &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)) &&
            (identical(other.actionParameters, actionParameters) ||
                const DeepCollectionEquality().equals(
                  other.actionParameters,
                  actionParameters,
                )) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality().equals(
                  other.subject,
                  subject,
                )) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality().equals(
                  other.properties,
                  properties,
                )) &&
            (identical(other.conditions, conditions) ||
                const DeepCollectionEquality().equals(
                  other.conditions,
                  conditions,
                )) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality().equals(
                  other.createdAt,
                  createdAt,
                )) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality().equals(
                  other.updatedAt,
                  updatedAt,
                )) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality().equals(
                  other.publishedAt,
                  publishedAt,
                )) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality().equals(
                  other.createdBy,
                  createdBy,
                )) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality().equals(
                  other.updatedBy,
                  updatedBy,
                )) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.localizations, localizations) ||
                const DeepCollectionEquality().equals(
                  other.localizations,
                  localizations,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(action) ^
      const DeepCollectionEquality().hash(actionParameters) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(conditions) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(localizations) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$ItemExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
  copyWith({
    double? id,
    String? documentId,
    String? action,
    dynamic actionParameters,
    String? subject,
    dynamic properties,
    dynamic conditions,
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role?
    role,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy?
    createdBy,
    Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy?
    updatedBy,
    String? locale,
    List<
      Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
    >?
    localizations,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      action: action ?? this.action,
      actionParameters: actionParameters ?? this.actionParameters,
      subject: subject ?? this.subject,
      properties: properties ?? this.properties,
      conditions: conditions ?? this.conditions,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      locale: locale ?? this.locale,
      localizations: localizations ?? this.localizations,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item
  copyWithWrapped({
    Wrapped<double?>? id,
    Wrapped<String?>? documentId,
    Wrapped<String?>? action,
    Wrapped<dynamic>? actionParameters,
    Wrapped<String?>? subject,
    Wrapped<dynamic>? properties,
    Wrapped<dynamic>? conditions,
    Wrapped<
      Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role?
    >?
    role,
    Wrapped<DateTime?>? createdAt,
    Wrapped<DateTime?>? updatedAt,
    Wrapped<DateTime?>? publishedAt,
    Wrapped<
      Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy?
    >?
    createdBy,
    Wrapped<
      Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy?
    >?
    updatedBy,
    Wrapped<String?>? locale,
    Wrapped<
      List<
        Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
      >?
    >?
    localizations,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
      action: (action != null ? action.value : this.action),
      actionParameters: (actionParameters != null
          ? actionParameters.value
          : this.actionParameters),
      subject: (subject != null ? subject.value : this.subject),
      properties: (properties != null ? properties.value : this.properties),
      conditions: (conditions != null ? conditions.value : this.conditions),
      role: (role != null ? role.value : this.role),
      createdAt: (createdAt != null ? createdAt.value : this.createdAt),
      updatedAt: (updatedAt != null ? updatedAt.value : this.updatedAt),
      publishedAt: (publishedAt != null ? publishedAt.value : this.publishedAt),
      createdBy: (createdBy != null ? createdBy.value : this.createdBy),
      updatedBy: (updatedBy != null ? updatedBy.value : this.updatedBy),
      locale: (locale != null ? locale.value : this.locale),
      localizations: (localizations != null
          ? localizations.value
          : this.localizations),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedByExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedByExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy copyWith({
    double? id,
    String? documentId,
  }) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$ItemExtension
    on Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
  copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleExtension
    on Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role
  copyWith({double? id, String? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByExtension
    on
        Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy
  copyWith({double? id, String? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByExtension
    on
        Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy
  copyWith({double? id, String? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item {
  const Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemExtension
    on
        Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item {
  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
  copyWith({double? id, String? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Category$Photo$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$RoleExtension
    on
        Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role
  copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Role(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedByExtension
    on
        Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy
  copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$CreatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedByExtension
    on
        Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy
  copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$UpdatedBy(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item {
  const Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item({
    this.id,
    this.documentId,
  });

  factory Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemFromJson(
        json,
      );

  static const toJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemToJson;
  Map<String, dynamic> toJson() =>
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemToJson(
        this,
      );

  @JsonKey(name: 'id', includeIfNull: false)
  final double? id;
  @JsonKey(name: 'documentId', includeIfNull: false, defaultValue: '')
  final String? documentId;
  static const fromJsonFactory =
      _$Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other
                is Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality().equals(
                  other.documentId,
                  documentId,
                )));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(documentId) ^
      runtimeType.hashCode;
}

extension $Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$ItemExtension
    on
        Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item {
  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
  copyWith({double? id, String? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
    );
  }

  Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item
  copyWithWrapped({Wrapped<double?>? id, Wrapped<String?>? documentId}) {
    return Product$Photo$Item$Folder$Files$Item$CreatedBy$Roles$Item$Permissions$Item$Localizations$Item(
      id: (id != null ? id.value : this.id),
      documentId: (documentId != null ? documentId.value : this.documentId),
    );
  }
}

String? authForgotPasswordPost$ResponseOkNullableToJson(
  enums.AuthForgotPasswordPost$ResponseOk? authForgotPasswordPost$ResponseOk,
) {
  return authForgotPasswordPost$ResponseOk?.value;
}

String? authForgotPasswordPost$ResponseOkToJson(
  enums.AuthForgotPasswordPost$ResponseOk authForgotPasswordPost$ResponseOk,
) {
  return authForgotPasswordPost$ResponseOk.value;
}

enums.AuthForgotPasswordPost$ResponseOk
authForgotPasswordPost$ResponseOkFromJson(
  Object? authForgotPasswordPost$ResponseOk, [
  enums.AuthForgotPasswordPost$ResponseOk? defaultValue,
]) {
  return enums.AuthForgotPasswordPost$ResponseOk.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            authForgotPasswordPost$ResponseOk?.toString().toLowerCase(),
      ) ??
      defaultValue ??
      enums.AuthForgotPasswordPost$ResponseOk.swaggerGeneratedUnknown;
}

enums.AuthForgotPasswordPost$ResponseOk?
authForgotPasswordPost$ResponseOkNullableFromJson(
  Object? authForgotPasswordPost$ResponseOk, [
  enums.AuthForgotPasswordPost$ResponseOk? defaultValue,
]) {
  if (authForgotPasswordPost$ResponseOk == null) {
    return null;
  }
  return enums.AuthForgotPasswordPost$ResponseOk.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            authForgotPasswordPost$ResponseOk.toString().toLowerCase(),
      ) ??
      defaultValue;
}

String authForgotPasswordPost$ResponseOkExplodedListToJson(
  List<enums.AuthForgotPasswordPost$ResponseOk>?
  authForgotPasswordPost$ResponseOk,
) {
  return authForgotPasswordPost$ResponseOk?.map((e) => e.value!).join(',') ??
      '';
}

List<String> authForgotPasswordPost$ResponseOkListToJson(
  List<enums.AuthForgotPasswordPost$ResponseOk>?
  authForgotPasswordPost$ResponseOk,
) {
  if (authForgotPasswordPost$ResponseOk == null) {
    return [];
  }

  return authForgotPasswordPost$ResponseOk.map((e) => e.value!).toList();
}

List<enums.AuthForgotPasswordPost$ResponseOk>
authForgotPasswordPost$ResponseOkListFromJson(
  List? authForgotPasswordPost$ResponseOk, [
  List<enums.AuthForgotPasswordPost$ResponseOk>? defaultValue,
]) {
  if (authForgotPasswordPost$ResponseOk == null) {
    return defaultValue ?? [];
  }

  return authForgotPasswordPost$ResponseOk
      .map((e) => authForgotPasswordPost$ResponseOkFromJson(e.toString()))
      .toList();
}

List<enums.AuthForgotPasswordPost$ResponseOk>?
authForgotPasswordPost$ResponseOkNullableListFromJson(
  List? authForgotPasswordPost$ResponseOk, [
  List<enums.AuthForgotPasswordPost$ResponseOk>? defaultValue,
]) {
  if (authForgotPasswordPost$ResponseOk == null) {
    return defaultValue;
  }

  return authForgotPasswordPost$ResponseOk
      .map((e) => authForgotPasswordPost$ResponseOkFromJson(e.toString()))
      .toList();
}

String? authSendEmailConfirmationPost$ResponseSentNullableToJson(
  enums.AuthSendEmailConfirmationPost$ResponseSent?
  authSendEmailConfirmationPost$ResponseSent,
) {
  return authSendEmailConfirmationPost$ResponseSent?.value;
}

String? authSendEmailConfirmationPost$ResponseSentToJson(
  enums.AuthSendEmailConfirmationPost$ResponseSent
  authSendEmailConfirmationPost$ResponseSent,
) {
  return authSendEmailConfirmationPost$ResponseSent.value;
}

enums.AuthSendEmailConfirmationPost$ResponseSent
authSendEmailConfirmationPost$ResponseSentFromJson(
  Object? authSendEmailConfirmationPost$ResponseSent, [
  enums.AuthSendEmailConfirmationPost$ResponseSent? defaultValue,
]) {
  return enums.AuthSendEmailConfirmationPost$ResponseSent.values
          .firstWhereOrNull(
            (e) =>
                e.value.toString().toLowerCase() ==
                authSendEmailConfirmationPost$ResponseSent
                    ?.toString()
                    .toLowerCase(),
          ) ??
      defaultValue ??
      enums.AuthSendEmailConfirmationPost$ResponseSent.swaggerGeneratedUnknown;
}

enums.AuthSendEmailConfirmationPost$ResponseSent?
authSendEmailConfirmationPost$ResponseSentNullableFromJson(
  Object? authSendEmailConfirmationPost$ResponseSent, [
  enums.AuthSendEmailConfirmationPost$ResponseSent? defaultValue,
]) {
  if (authSendEmailConfirmationPost$ResponseSent == null) {
    return null;
  }
  return enums.AuthSendEmailConfirmationPost$ResponseSent.values
          .firstWhereOrNull(
            (e) =>
                e.value.toString().toLowerCase() ==
                authSendEmailConfirmationPost$ResponseSent
                    .toString()
                    .toLowerCase(),
          ) ??
      defaultValue;
}

String authSendEmailConfirmationPost$ResponseSentExplodedListToJson(
  List<enums.AuthSendEmailConfirmationPost$ResponseSent>?
  authSendEmailConfirmationPost$ResponseSent,
) {
  return authSendEmailConfirmationPost$ResponseSent
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> authSendEmailConfirmationPost$ResponseSentListToJson(
  List<enums.AuthSendEmailConfirmationPost$ResponseSent>?
  authSendEmailConfirmationPost$ResponseSent,
) {
  if (authSendEmailConfirmationPost$ResponseSent == null) {
    return [];
  }

  return authSendEmailConfirmationPost$ResponseSent
      .map((e) => e.value!)
      .toList();
}

List<enums.AuthSendEmailConfirmationPost$ResponseSent>
authSendEmailConfirmationPost$ResponseSentListFromJson(
  List? authSendEmailConfirmationPost$ResponseSent, [
  List<enums.AuthSendEmailConfirmationPost$ResponseSent>? defaultValue,
]) {
  if (authSendEmailConfirmationPost$ResponseSent == null) {
    return defaultValue ?? [];
  }

  return authSendEmailConfirmationPost$ResponseSent
      .map(
        (e) => authSendEmailConfirmationPost$ResponseSentFromJson(e.toString()),
      )
      .toList();
}

List<enums.AuthSendEmailConfirmationPost$ResponseSent>?
authSendEmailConfirmationPost$ResponseSentNullableListFromJson(
  List? authSendEmailConfirmationPost$ResponseSent, [
  List<enums.AuthSendEmailConfirmationPost$ResponseSent>? defaultValue,
]) {
  if (authSendEmailConfirmationPost$ResponseSent == null) {
    return defaultValue;
  }

  return authSendEmailConfirmationPost$ResponseSent
      .map(
        (e) => authSendEmailConfirmationPost$ResponseSentFromJson(e.toString()),
      )
      .toList();
}

String? usersPermissionsRolesPost$ResponseOkNullableToJson(
  enums.UsersPermissionsRolesPost$ResponseOk?
  usersPermissionsRolesPost$ResponseOk,
) {
  return usersPermissionsRolesPost$ResponseOk?.value;
}

String? usersPermissionsRolesPost$ResponseOkToJson(
  enums.UsersPermissionsRolesPost$ResponseOk
  usersPermissionsRolesPost$ResponseOk,
) {
  return usersPermissionsRolesPost$ResponseOk.value;
}

enums.UsersPermissionsRolesPost$ResponseOk
usersPermissionsRolesPost$ResponseOkFromJson(
  Object? usersPermissionsRolesPost$ResponseOk, [
  enums.UsersPermissionsRolesPost$ResponseOk? defaultValue,
]) {
  return enums.UsersPermissionsRolesPost$ResponseOk.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            usersPermissionsRolesPost$ResponseOk?.toString().toLowerCase(),
      ) ??
      defaultValue ??
      enums.UsersPermissionsRolesPost$ResponseOk.swaggerGeneratedUnknown;
}

enums.UsersPermissionsRolesPost$ResponseOk?
usersPermissionsRolesPost$ResponseOkNullableFromJson(
  Object? usersPermissionsRolesPost$ResponseOk, [
  enums.UsersPermissionsRolesPost$ResponseOk? defaultValue,
]) {
  if (usersPermissionsRolesPost$ResponseOk == null) {
    return null;
  }
  return enums.UsersPermissionsRolesPost$ResponseOk.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            usersPermissionsRolesPost$ResponseOk.toString().toLowerCase(),
      ) ??
      defaultValue;
}

String usersPermissionsRolesPost$ResponseOkExplodedListToJson(
  List<enums.UsersPermissionsRolesPost$ResponseOk>?
  usersPermissionsRolesPost$ResponseOk,
) {
  return usersPermissionsRolesPost$ResponseOk?.map((e) => e.value!).join(',') ??
      '';
}

List<String> usersPermissionsRolesPost$ResponseOkListToJson(
  List<enums.UsersPermissionsRolesPost$ResponseOk>?
  usersPermissionsRolesPost$ResponseOk,
) {
  if (usersPermissionsRolesPost$ResponseOk == null) {
    return [];
  }

  return usersPermissionsRolesPost$ResponseOk.map((e) => e.value!).toList();
}

List<enums.UsersPermissionsRolesPost$ResponseOk>
usersPermissionsRolesPost$ResponseOkListFromJson(
  List? usersPermissionsRolesPost$ResponseOk, [
  List<enums.UsersPermissionsRolesPost$ResponseOk>? defaultValue,
]) {
  if (usersPermissionsRolesPost$ResponseOk == null) {
    return defaultValue ?? [];
  }

  return usersPermissionsRolesPost$ResponseOk
      .map((e) => usersPermissionsRolesPost$ResponseOkFromJson(e.toString()))
      .toList();
}

List<enums.UsersPermissionsRolesPost$ResponseOk>?
usersPermissionsRolesPost$ResponseOkNullableListFromJson(
  List? usersPermissionsRolesPost$ResponseOk, [
  List<enums.UsersPermissionsRolesPost$ResponseOk>? defaultValue,
]) {
  if (usersPermissionsRolesPost$ResponseOk == null) {
    return defaultValue;
  }

  return usersPermissionsRolesPost$ResponseOk
      .map((e) => usersPermissionsRolesPost$ResponseOkFromJson(e.toString()))
      .toList();
}

String? usersPermissionsRolesRolePut$ResponseOkNullableToJson(
  enums.UsersPermissionsRolesRolePut$ResponseOk?
  usersPermissionsRolesRolePut$ResponseOk,
) {
  return usersPermissionsRolesRolePut$ResponseOk?.value;
}

String? usersPermissionsRolesRolePut$ResponseOkToJson(
  enums.UsersPermissionsRolesRolePut$ResponseOk
  usersPermissionsRolesRolePut$ResponseOk,
) {
  return usersPermissionsRolesRolePut$ResponseOk.value;
}

enums.UsersPermissionsRolesRolePut$ResponseOk
usersPermissionsRolesRolePut$ResponseOkFromJson(
  Object? usersPermissionsRolesRolePut$ResponseOk, [
  enums.UsersPermissionsRolesRolePut$ResponseOk? defaultValue,
]) {
  return enums.UsersPermissionsRolesRolePut$ResponseOk.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            usersPermissionsRolesRolePut$ResponseOk?.toString().toLowerCase(),
      ) ??
      defaultValue ??
      enums.UsersPermissionsRolesRolePut$ResponseOk.swaggerGeneratedUnknown;
}

enums.UsersPermissionsRolesRolePut$ResponseOk?
usersPermissionsRolesRolePut$ResponseOkNullableFromJson(
  Object? usersPermissionsRolesRolePut$ResponseOk, [
  enums.UsersPermissionsRolesRolePut$ResponseOk? defaultValue,
]) {
  if (usersPermissionsRolesRolePut$ResponseOk == null) {
    return null;
  }
  return enums.UsersPermissionsRolesRolePut$ResponseOk.values.firstWhereOrNull(
        (e) =>
            e.value.toString().toLowerCase() ==
            usersPermissionsRolesRolePut$ResponseOk.toString().toLowerCase(),
      ) ??
      defaultValue;
}

String usersPermissionsRolesRolePut$ResponseOkExplodedListToJson(
  List<enums.UsersPermissionsRolesRolePut$ResponseOk>?
  usersPermissionsRolesRolePut$ResponseOk,
) {
  return usersPermissionsRolesRolePut$ResponseOk
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> usersPermissionsRolesRolePut$ResponseOkListToJson(
  List<enums.UsersPermissionsRolesRolePut$ResponseOk>?
  usersPermissionsRolesRolePut$ResponseOk,
) {
  if (usersPermissionsRolesRolePut$ResponseOk == null) {
    return [];
  }

  return usersPermissionsRolesRolePut$ResponseOk.map((e) => e.value!).toList();
}

List<enums.UsersPermissionsRolesRolePut$ResponseOk>
usersPermissionsRolesRolePut$ResponseOkListFromJson(
  List? usersPermissionsRolesRolePut$ResponseOk, [
  List<enums.UsersPermissionsRolesRolePut$ResponseOk>? defaultValue,
]) {
  if (usersPermissionsRolesRolePut$ResponseOk == null) {
    return defaultValue ?? [];
  }

  return usersPermissionsRolesRolePut$ResponseOk
      .map((e) => usersPermissionsRolesRolePut$ResponseOkFromJson(e.toString()))
      .toList();
}

List<enums.UsersPermissionsRolesRolePut$ResponseOk>?
usersPermissionsRolesRolePut$ResponseOkNullableListFromJson(
  List? usersPermissionsRolesRolePut$ResponseOk, [
  List<enums.UsersPermissionsRolesRolePut$ResponseOk>? defaultValue,
]) {
  if (usersPermissionsRolesRolePut$ResponseOk == null) {
    return defaultValue;
  }

  return usersPermissionsRolesRolePut$ResponseOk
      .map((e) => usersPermissionsRolesRolePut$ResponseOkFromJson(e.toString()))
      .toList();
}

String? usersPermissionsRolesRoleDelete$ResponseOkNullableToJson(
  enums.UsersPermissionsRolesRoleDelete$ResponseOk?
  usersPermissionsRolesRoleDelete$ResponseOk,
) {
  return usersPermissionsRolesRoleDelete$ResponseOk?.value;
}

String? usersPermissionsRolesRoleDelete$ResponseOkToJson(
  enums.UsersPermissionsRolesRoleDelete$ResponseOk
  usersPermissionsRolesRoleDelete$ResponseOk,
) {
  return usersPermissionsRolesRoleDelete$ResponseOk.value;
}

enums.UsersPermissionsRolesRoleDelete$ResponseOk
usersPermissionsRolesRoleDelete$ResponseOkFromJson(
  Object? usersPermissionsRolesRoleDelete$ResponseOk, [
  enums.UsersPermissionsRolesRoleDelete$ResponseOk? defaultValue,
]) {
  return enums.UsersPermissionsRolesRoleDelete$ResponseOk.values
          .firstWhereOrNull(
            (e) =>
                e.value.toString().toLowerCase() ==
                usersPermissionsRolesRoleDelete$ResponseOk
                    ?.toString()
                    .toLowerCase(),
          ) ??
      defaultValue ??
      enums.UsersPermissionsRolesRoleDelete$ResponseOk.swaggerGeneratedUnknown;
}

enums.UsersPermissionsRolesRoleDelete$ResponseOk?
usersPermissionsRolesRoleDelete$ResponseOkNullableFromJson(
  Object? usersPermissionsRolesRoleDelete$ResponseOk, [
  enums.UsersPermissionsRolesRoleDelete$ResponseOk? defaultValue,
]) {
  if (usersPermissionsRolesRoleDelete$ResponseOk == null) {
    return null;
  }
  return enums.UsersPermissionsRolesRoleDelete$ResponseOk.values
          .firstWhereOrNull(
            (e) =>
                e.value.toString().toLowerCase() ==
                usersPermissionsRolesRoleDelete$ResponseOk
                    .toString()
                    .toLowerCase(),
          ) ??
      defaultValue;
}

String usersPermissionsRolesRoleDelete$ResponseOkExplodedListToJson(
  List<enums.UsersPermissionsRolesRoleDelete$ResponseOk>?
  usersPermissionsRolesRoleDelete$ResponseOk,
) {
  return usersPermissionsRolesRoleDelete$ResponseOk
          ?.map((e) => e.value!)
          .join(',') ??
      '';
}

List<String> usersPermissionsRolesRoleDelete$ResponseOkListToJson(
  List<enums.UsersPermissionsRolesRoleDelete$ResponseOk>?
  usersPermissionsRolesRoleDelete$ResponseOk,
) {
  if (usersPermissionsRolesRoleDelete$ResponseOk == null) {
    return [];
  }

  return usersPermissionsRolesRoleDelete$ResponseOk
      .map((e) => e.value!)
      .toList();
}

List<enums.UsersPermissionsRolesRoleDelete$ResponseOk>
usersPermissionsRolesRoleDelete$ResponseOkListFromJson(
  List? usersPermissionsRolesRoleDelete$ResponseOk, [
  List<enums.UsersPermissionsRolesRoleDelete$ResponseOk>? defaultValue,
]) {
  if (usersPermissionsRolesRoleDelete$ResponseOk == null) {
    return defaultValue ?? [];
  }

  return usersPermissionsRolesRoleDelete$ResponseOk
      .map(
        (e) => usersPermissionsRolesRoleDelete$ResponseOkFromJson(e.toString()),
      )
      .toList();
}

List<enums.UsersPermissionsRolesRoleDelete$ResponseOk>?
usersPermissionsRolesRoleDelete$ResponseOkNullableListFromJson(
  List? usersPermissionsRolesRoleDelete$ResponseOk, [
  List<enums.UsersPermissionsRolesRoleDelete$ResponseOk>? defaultValue,
]) {
  if (usersPermissionsRolesRoleDelete$ResponseOk == null) {
    return defaultValue;
  }

  return usersPermissionsRolesRoleDelete$ResponseOk
      .map(
        (e) => usersPermissionsRolesRoleDelete$ResponseOkFromJson(e.toString()),
      )
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
    chopper.Response response,
  ) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
        body:
            DateTime.parse((response.body as String).replaceAll('"', ''))
                as ResultType,
      );
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
      body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType,
    );
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
