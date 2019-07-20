function logout() {
    return axios({
        url: api.logout,
        type: 'post',
    })
}

function login(data) {
    return axios({
        url: api.login,
        type: 'post',
        data: data
    })
}

function register(data) {
    return axios({
        url: api.register,
        type: 'post',
        data: data
    })
}