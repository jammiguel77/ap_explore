const String usersTable = "users";

class UsersFields {
  static final List<String> values = [
    id,
    user,
    password,
    idProy,
    idCliente,
    iStatus,
    iid,
  ];

  static const String id = "_id";
  static const String user = "user";
  static const String password = "password";
  static const String idProy = "idProy";
  static const String idCliente = "idCliente";
  static const String iStatus = "iStatus";
  static const String iid = "iid";
}

class Users {
  final int id;
  final String user;
  final String password;
  final int idProy;
  final int idCliente;
  final bool iStatus;
  final int iid;

  Users(this.id, this.user, this.password, this.idProy, this.idCliente, this.iStatus, this.iid,);

  
 

  // Users copy({
  //   int? id,
  //   String? user,
  //   String? password,
  //   int? idProy,
  //   int? idCleinte,
  //   int? iStatus,
  //   bool? iid, 
  // }) =>
  //     Users(
  //       id: id ?? this.id,
  //       user: user ?? this.user,
  //       password: password ?? this.password,
  //       idProy: idProy ?? this.idProy,
  //       idCleinte: idCleinte ?? this.idCleinte,
  //       iStatus: iStatus ?? this.iStatus,
  //       iid: iid ?? this.iid,

  //     );

  Map<String, Object?> toJson() => {
        UsersFields.id: id,
        UsersFields.user: user,
        UsersFields.password: password,
        UsersFields.idProy: idProy,
        UsersFields.idCliente: idCliente,
        UsersFields.iStatus: iStatus ? 1 : 0,
        UsersFields.iid: iid,
      };
}
