from robot.api.deco import keyword
from pymongo import MongoClient
import bcrypt

client = MongoClient('mongodb+srv://qa:xperience@cluster0.2hf3mrp.mongodb.net/?retryWrites=true&w=majority')

db = client['markdb']

#apagar resquicios do BD
@keyword('Clean user from database')
def clean_user(user_email):
    #acessando users e tasks do BD
    users = db['users']
    tasks = db['tasks']

    #busca por um registro cujo email seja igual a user_email
    u = users.find_one({'email': user_email})

    #o código acima só funciona se o usuário existir, por isso utilizo o IF
    if (u):
        tasks.delete_many({'user': u['_id']})
        users.delete_many({'email' : user_email})

@keyword('Remove user from database')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print('Removing user by ' + email)

@keyword('Insert user from database')
def insert_user(user):

    hash_pass = bcrypt.hashpw(user['password'].encode('utf-8'), bcrypt.gensalt(8))

    doc = {
        'name': user['name'],
        'email': user['email'],
        'password': hash_pass
    }

    users = db['users']
    users.insert_one(doc)
    print(user)
