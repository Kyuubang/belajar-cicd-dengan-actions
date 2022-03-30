
def test_response_code(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b'Hello World!' in response.data

def test_custom(client):
    response = client.get('/yourname')
    assert response.status_code == 200
    assert b'Hello, yourname' in response.data
