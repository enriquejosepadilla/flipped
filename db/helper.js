var crypto = require('crypto');
var jwt = require('jsonwebtoken');
var _ = require('lodash');
var uuid = require('uuid');


function User(user){
    console.log("creating user");
    this.username = user.username;
    this.password = user.password;
    this.email = user.email;
    this.isTeacher = user.isTeacher;
    this.id = user.id || uuid.v4();
}


User.prototype.generateJWT =  function() {

    // set expiration to 60 days
    var today = new Date();
    var exp = new Date(today);
    exp.setDate(today.getDate() + 60);


    return jwt.sign({
        _id: this._id,
        username: this.username,
        exp: parseInt(exp.getTime() / 1000)
    }, 'SECRET');
};

module.exports.User = User;