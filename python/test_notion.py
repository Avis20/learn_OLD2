import requests

DATABASE_ID = "8edd659c21a44c3a8a54c40ac332db30"
NOTION_URL = 'https://api.notion.com/v1/databases/'

class NotionSync:
    def __init__(self):
        pass    

    def query_databases(self,integration_token="secret_OVSuenhidPAalQHp2So2cDzmZ4gB412GcffXMmfFvvh"):
        database_url = NOTION_URL + DATABASE_ID + "/query"
        print(database_url)
        response = requests.post(database_url, headers={"Authorization": f"{integration_token}"})
        print(response.content)
        return None
    
    def get_projects_titles(self,data_json):
        return list(data_json["results"][0]["properties"].keys())
    

    def get_projects_data(self,data_json,projects):
        projects_data = {}
        for p in projects:
            if p!="Name" and p !="Date":
                projects_data[p] = [data_json["results"][i]["properties"][p]["checkbox"]
                                    for i in range(len(data_json["results"]))]
            elif p=="Date":
                dates = [data_json["results"][i]["properties"]["Date"]["date"]["start"]
                                    for i in range(len(data_json["results"]))]

        
        return projects_data,dates

nsync = NotionSync()
data = nsync.query_databases()
projects = nsync.get_projects_titles(data)
projects_data,dates = nsync.get_projects_data(data,projects)