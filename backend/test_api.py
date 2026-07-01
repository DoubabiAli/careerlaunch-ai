import requests

url = "https://jsonplaceholder.typicode.com/posts/1"

response = requests.get(url)

print("Code HTTP :", response.status_code)
print("Réponse :")
print(response.json())