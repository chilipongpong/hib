package com.hizon

class ClientService {

    def getClient(User user) {
		return Client.findByUser(user);
    }
}
