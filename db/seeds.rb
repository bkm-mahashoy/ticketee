admin_user = User.create(email: "admin@ticketee.com",
                         password: "password")
admin_user.admin = true
admin_user.confirm!

Project.create(name: "Ticketee Beta")

State.create(name: "New", color: "white", background: "85FF00", default: true)
State.create(name: "Open", color: "white", background: "#00CFFD")
State.create(name: "Closed", color: "white", background: "black")
