class ChatouRouter(object): 
    def db_for_read(self, model, **hints):
        "Point all operations on chatou models to 'chatoudb'"
        if model._meta.app_label == 'chatou':
            return 'chatoudb'
        return 'default'

    def db_for_write(self, model, **hints):
        "Point all operations on chatou models to 'chatoudb'"
        if model._meta.app_label == 'chatou':
            return 'chatoudb'
        return 'default'
    
    def allow_relation(self, obj1, obj2, **hints):
        "Allow any relation if a both models in chatou app"
        if obj1._meta.app_label == 'chatou' and obj2._meta.app_label == 'chatou':
            return True
        # Allow if neither is chinook app
        elif 'chatou' not in [obj1._meta.app_label, obj2._meta.app_label]: 
            return True
        return False
    
    def allow_syncdb(self, db, model):
        if db == 'chatoudb' or model._meta.app_label == "chatou":
            return False # we're not using syncdb on our legacy database
        else: # but all other models/databases are fine
            return True