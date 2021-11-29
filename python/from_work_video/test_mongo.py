
import pymongo

client = pymongo.MongoClient(host="localhost", port=27017)
print(client.list_database_names())

db = client["blog"]
COLLECTION_USERS = "users"

def create_admin():
    user_name = 'admin'
    result = db[COLLECTION_USERS].insert_one({
        user_name: user_name
    })
    print(result.inserted_id)
    admin = db[COLLECTION_USERS].find_one({"_id": result.inserted_id})
    print(admin)

if __name__ == '__main__':
    create_admin()

