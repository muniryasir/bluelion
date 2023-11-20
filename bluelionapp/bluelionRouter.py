class BluelionRouter(object): 
    def db_for_read(self, model, **hints):
        "Point all operations on chatou models to 'Chatoudb'"
        if model._meta.app_label == 'chatou_auto':
            return 'Chatoudb'
        if model._meta.app_label == 'commune_de_paris':
            return 'CommunedeParisdb'
        return 'default'

    def db_for_write(self, model, **hints):
        "Point all operations on chatou models to 'Chatoudb'"
        if model._meta.app_label == 'chatou_auto':
            return 'Chatoudb'
        if model._meta.app_label == 'commune_de_paris':
            return 'CommunedeParisdb'
        return 'default'
    
    def allow_relation(self, obj1, obj2, **hints):
        "Allow any relation if a both models in chatou app"
        if obj1._meta.app_label == 'chatou_auto' and obj2._meta.app_label == 'chatou_auto':
            return True
        
        # Allow if neither is chinook app
        elif 'chatou_auto' not in [obj1._meta.app_label, obj2._meta.app_label]: 
            return True
        elif obj1._meta.app_label == 'commune_de_paris' and obj2._meta.app_label == 'commune_de_paris':
            return True
        # Allow if neither is chinook app
        elif 'commune_de_paris' not in [obj1._meta.app_label, obj2._meta.app_label]: 
            return True
        return False
    
    def allow_syncdb(self, db, model):
        if db == 'Chatoudb' or model._meta.app_label == "chatou_auto":
            return False # we're not using syncdb on our legacy database
        elif db == 'CommunedeParisdb' or model._meta.app_label == "commune_de_paris":
            return False # we're not using syncdb on our legacy database
        else: # but all other models/databases are fine
            return True