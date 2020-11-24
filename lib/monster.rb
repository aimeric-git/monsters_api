require 'httparty'

response = HTTParty.get('https://fr.dofus.dofapi.fr/monsters/')

#filtrer la réponse pour avoir les monstres de type Larves
    hash_larves = response.select{ |k| k["type"] == "Larves"}
    #envoyer le fichier dans un json
    File.open("monsters_larves.json", 'w') do |file|
        file.write(hash_larves.to_json)
    end
    

    #filtrer la réponse pour avoir les monstres Monstres des cavernes
    hash_cavernes = response.select{ |k| k["type"] == "Monstres des cavernes"}
        #envoyer le fichier dans un json d'une autre façon
        File.write("monster_cavernes.json", hash_cavernes.to_json, mode: "w")
        

        #filtrer la réponse pour avoir les Monstres des Plaines herbeuses
        hash_herbeuses = response.select{ |k| k["type"] == "Monstres des Plaines herbeuses"}
        File.write("monster_herbeuses.json", hash_herbeuses.to_json, mode: "w")
        