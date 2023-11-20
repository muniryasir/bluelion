class CommunedeParisRouter(object): 
    def db_for_read(self, model, **hints):
        "Point all operations on commune_de_paris models to 'CommunedeParisdb'"
        if model._meta.app_label == 'commune_de_paris':
            return 'CommunedeParisdb'
        return 'default'

    def db_for_write(self, model, **hints):
        "Point all operations on commune_de_paris models to 'CommunedeParisdb'"
        if model._meta.app_label == 'commune_de_paris':
            return 'CommunedeParisdb'
        return 'default'
    
    def allow_relation(self, obj1, obj2, **hints):
        "Allow any relation if a both models in commune_de_paris app"
        if obj1._meta.app_label == 'commune_de_paris' and obj2._meta.app_label == 'commune_de_paris':
            return True
        # Allow if neither is chinook app
        elif 'commune_de_paris' not in [obj1._meta.app_label, obj2._meta.app_label]: 
            return True
        return False
    
    def allow_syncdb(self, db, model):
        if db == 'CommunedeParisdb' or model._meta.app_label == "commune_de_paris":
            return False # we're not using syncdb on our legacy database
        else: # but all other models/databases are fine
            return True