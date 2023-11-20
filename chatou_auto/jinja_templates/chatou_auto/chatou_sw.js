importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.0.0/workbox-sw.js');
workbox.loadModule('workbox-precaching');
workbox.loadModule('workbox-routing');
workbox.loadModule('workbox-strategies');
workbox.loadModule('workbox-expiration');
workbox.loadModule('workbox-core');



if (workbox) {
  console.log(`Yay! Workbox is loaded`);
} else {
  console.log(`Boo! Workbox didn't load`);
}


const OFFLINE_URL = '{{ offline_url }}';
const appShell = [
    '/static/chatou_auto/manifest.json',
    '/',
].map((partialUrl) => `${location.protocol}//${location.host}${partialUrl}`);

var media_files = [];

function fetchfiles() {
fetch('/getmediafiles/')
.then(

  function (response) {
      
      response.json().then(function(data) {
        
        
         for(var i=0; i<data.media_files.length; i++) {
           media_files[i] = {url:data.media_files[i], revision: '383676'};      
         }
         console.log(JSON.stringify(media_files));

        
        


      });
    
  }
)
.catch(function(err) {
  console.log('Fetch Error :-S', err);
});
}



function serviceWorkerCore () { 

var site_links = [
  {url: '/', revision: '383676'},
  {url: '/un-peu-dhistoire', revision: '383676'},
  {url: '/itineraire-dart-et-histoire', revision: '383676'},
  {url: '/itineraire-dart-et-histoire/la-maison-fournaise', revision: '383676'},
  {url: '/chatou-d-antan', revision: '383676'},
  {url: '/chatou-d-antan/gare-de-chatou', revision: '383676'},
  {url: '/chatou-d-antan/avenue-des-tilleuls', revision: '383676'},
  {url: '/chatou-d-antan/rue-du-general-colin', revision: '383676'},
  {url: '/chatou-d-antan/avenue-d-aligre', revision: '383676'},
  {url: '/chatou-d-antan/square-realier-dumas', revision: '383676'},
  {url: '/chatou-d-antan/quai-amiral-mouchez', revision: '383676'},
    {url: '/chatou-d-antan/eglise-et-ancien-presbytere', revision: '383676'},
    {url: '/chatou-d-antan/rue-de-la-paroisse', revision: '383676'},
    {url: '/chatou-d-antan/rue-du-port', revision: '383676'},
    {url: '/chatou-d-antan/le-parc-de-chatou', revision: '383676'},
    {url: '/chatou-d-antan/rue-du-docteur-rochefort', revision: '383676'},
    {url: '/chatou-d-antan/l-ecole-maternelle', revision: '383676'},
    {url: '/chatou-d-antan/avenue-des-27-martyrs', revision: '383676'},
    {url: '/chatou-d-antan/lentree-de-la-villa-lambert', revision: '383676'},
    {url: '/chatou-d-antan/le-chalet-laubeuf', revision: '383676'},
    {url: '/chatou-d-antan/le-chatelet', revision: '383676'},
    {url: '/chatou-d-antan/la-route-des-maisons', revision: '383676'},
    {url: '/chatou-d-antan/rue-des-landes', revision: '383676'},
    {url: '/chatou-d-antan/le-boulevard-de-la-republique', revision: '383676'},
    {url: '/chatou-d-antan/chateau-de-la-faisanderie', revision: '383676'},
    {url: '/chatou-d-antan/l-ancienne-poste', revision: '383676'},
    {url: '/chatou-d-antan/le-cafe-de-lhotel-de-ville', revision: '383676'},
    {url: '/chatou-d-antan/le-tramway', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/la-maison-levanneur', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/l-eglise-de-notre-dame-de-l-assomption', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/le-chateau-bertin', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/le-nymphee-de-soufflot', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/la-villa-lambert', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/le-boulevard-de-la-republique', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/les-usines-pathe', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/l-hotel-de-ville', revision: '383676'},
    {url: '/itineraire-dart-et-d-histoire/la-place-bertaux', revision: '383676'},   
    {url: '/itineraire-dart-et-d-histoire/la-gare-de-chatou-croissy',revision: '383676'},
    {url: '/a-la-source-de-limpressionnisme',revision: '383676'},
    {url: '/a-propos', revision: '383676'},
    
];



var html_files = [
  {url: '/static/chatou_auto/pwa/home.json'},
  {url: '/static/chatou_auto/pwa/un-peu-dhistoire.json'},
  {url: '/static/chatou_auto/pwa/itineraire-dart-et-histoire.json'},
  {url: '/static/chatou_auto/pwa/la-maison-fournaise.json'},
  {url: '/static/chatou_auto/pwa/chatou-d-antan.json'},
  {url: '/static/chatou_auto/pwa/gare-de-chatou.json'},
  {url: '/static/chatou_auto/pwa/rue-du-general-colin.json'},
  {url: '/static/chatou_auto/pwa/avenue-d-aligre.json'},
  {url: '/static/chatou_auto/pwa/square-realier-dumas.json'},
  {url: '/static/chatou_auto/pwa/quai-amiral-mouchez.json'},
  {url: '/static/chatou_auto/pwa/eglise-et-ancien-presbytere.json'},
  {url: '/static/chatou_auto/pwa/rue-de-la-paroisse.json'},
  {url: '/static/chatou_auto/pwa/rue-du-port.json'},
  {url: '/static/chatou_auto/pwa/le-parc-de-chatou.json'},
  {url: '/static/chatou_auto/pwa/rue-du-docteur-rochefort.json'},
  {url: '/static/chatou_auto/pwa/l-ecole-maternelle.json'},
  {url: '/static/chatou_auto/pwa/avenue-des-27-martyrs.json'},
  {url: '/static/chatou_auto/pwa/lentree-de-la-villa-lambert.json'},
  {url: '/static/chatou_auto/pwa/le-chalet-laubeuf.json'},
  {url: '/static/chatou_auto/pwa/le-chatelet.json'},
  {url: '/static/chatou_auto/pwa/la-route-des-maisons.json'},
  {url: '/static/chatou_auto/pwa/rue-des-landes.json'},
  {url: '/static/chatou_auto/pwa/le-boulevard-de-la-republique.json'},
  {url: '/static/chatou_auto/pwa/chateau-de-la-faisanderie.json'},
  {url: '/static/chatou_auto/pwa/l-ancienne-poste.json'},
  {url: '/static/chatou_auto/pwa/le-cafe-de-lhotel-de-ville.json'},
  {url: '/static/chatou_auto/pwa/le-tramway.json'},
  {url: '/static/chatou_auto/pwa/la-maison-levanneur.json'},
  {url: '/static/chatou_auto/pwa/l-eglise-de-notre-dame-de-l-assomption.json'},
  {url: '/static/chatou_auto/pwa/le-chateau-bertin.json'},
  {url: '/static/chatou_auto/pwa/le-nymphee-de-soufflot.json'},
  {url: '/static/chatou_auto/pwa/la-villa-lambert.json'},
  {url: '/static/chatou_auto/pwa/le-boulevard-de-la-republique.json'},
  {url: '/static/chatou_auto/pwa/les-usines-pathe.json'},
  {url: '/static/chatou_auto/pwa/l-hotel-de-ville.json'},
  {url: '/static/chatou_auto/pwa/la-place-bertaux.json'},
  {url: '/static/chatou_auto/pwa/la-gare-de-chatou-croissy.json'},
  {url: '/static/chatou_auto/pwa/a-la-source-de-limpressionnisme.json'},
  {url: '/static/chatou_auto/pwa/a-propos.json'},
];
var image_files = [{url:"media/media/chatou_auto/Res_1200_Chatou_Parc_051c_Lentr\u00e9e_du_Parc.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Sequana_Chatou.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_R\u00e9publique_023_Usines_Path\u00e9.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Republique_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Gare_012_Place_de_la_Gare.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Eglise_et_Creche_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_R\u00e9publique_024_Usines_Path\u00e9-Marconi.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Une_classe_de_maternelle.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Mairie_par_Moonik_H\u00f4tel_de_Ville_W.JPG", revision: '383676'},
{url:"media/media/chatou_auto/Docteur_Rochefort_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/BL_Apps_Logos_Res_150.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_R\u00e9publique_013_Boulevard_de_la_R\u00e9publique.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatelet_After_1200_wiVWOLM.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Villa_Realier-Dumas_Apres_vs5.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Brimont_011b_Sortie_de_l\u00e9cole_exp_1908.jpg", revision: '383676'},
{url:"media/media/chatou_auto/BL_logos_blanc_apps_v2_cropped_200.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Roslin_Bertin.png", revision: '383676'},
{url:"media/media/chatou_auto/Voiture_a_vapeur_et_chemin_de_fer_Anonyme.JPG", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_La_faisanderie.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_Eglise_04_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Cafe_Hotel_de_Ville_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/La_Faisand\u00e9rie_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Mairie_053_Rue_P\u00e9rier__lancienne_Poste_Bd_Foch_vers_1911.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Parc_065_Le_Nymph\u00e9e_1905.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Eglise_et_Creche_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Pierre-Auguste_Renoir_-_Luncheon_of_the_Boating_Party_vs2_Google_Art_Project.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Entr\u00e9e_du_Pays_-_Place_du_March\u00e9_1910_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Vue_sur_Ile_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Derain_et_Vlaminck_en_1942.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Mairie_035_La_Mairie.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Tramway_vapeur_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Landes_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Quai_Mouchez_2_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Pi\u00e8ce_dEau_011b_Avenue_de_la_Pi\u00e8ce_dEau.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Mairie_097_Rue_de_Saint-Germain_devant_la_Mairie_circulee_1907.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Avenue_Aligre_Avant_1907.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Parc_080_Le_Ch\u00e2teau_Bertin_1910_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Eglise_06_Vue_Aerienne_est_apr\u00e8s_1960.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Header_1st_Itinerary_Plan_de_la_forest_du_Vezinet_fait_en_lann\u00e9e_1783_par_Main_premier_arpenteur_en_la_Ma\u00eetrise_des_Eaux_et_Forest_de_St_Germain_1783_PFEiIeo.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Gare_101_Monument_Berteaux.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Berteaux_020c_Salle_des_F\u00eates.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Route_de_Maisons_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Cote_Croissy_Gare_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Grille_Villa_Lambert_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Vue_sur_Ile_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Villa_Realier-Dumas_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Rue_du_Port_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Mairie_et_Place.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Ecole_maternelle_Bousson_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Bords_de_Seine_054_Villa_Realier-Dumas.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_\u00cele_042_La_Maison_Fournaise_depuis_le_Pont_RnxKUW0.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatelet_After_1200.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Gare_Apr\u00e8s.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Dans_le_Parc_de_Chatou_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_\u00cele_042_La_Maison_Fournaise_depuis_le_Pont.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Docteur_Rochefort_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200Chatou_Bords_de_Seine_051d_Vue_sur_le_Quai_Mouchez.jpg", revision: '383676'},
{url:"media/media/chatou_auto/BNF_Parc_du_Vesinet_Plan_general_indiquant_le_lotissement.jpeg", revision: '383676'},
{url:"media/media/chatou_auto/Res_Ancienne_entr\u00e9e_Chateau_de_la_pi\u00e8ce_deau_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Pierre_Auguste_Renoir_Alphonsine_Fournaise_on_the_Isle_of_Chatou_1879_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_R\u00e9publique_041_La_Faisand\u00e9rie_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Ch\u00e2telet_Before_1200.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Cote_Croissy_Gare_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Camille_Corot_la_Seine_\u00e0_Chatou_1855_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_R\u00e9publique_011_Boulevard_de_la_R\u00e9publique.jpg", revision: '383676'},
{url:"media/media/chatou_auto/ville-de-chatou_100.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Landes_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Rue_de_la_Paroisse_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/48x48facebook3.png", revision: '383676'},
{url:"media/media/chatou_auto/Chalet_Laubeuf_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Pi\u00e8ce_dEau_031_Le_petit_lac.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Parc_073b_Le_Ch\u00e2telet_Route_de_Montesson.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Quai_Mouchez_2_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Eglise_039b_Rue_de_la_Paroisse_Devanture_Magasin_du_P\u00e8re_Jarry.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200Chatou_Eglise_062c_Square_et_\u00c9glise.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Mairie_097_Rue_de_Saint-Germain_devant_la_Mairie_circul\u00e9e_1907.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200Chatou_Eglise_041_Rue_de_la_Paroisse.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chalet_Laubeuf_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_R\u00e9publique_010c_Carrefour_Route_de_Montesson.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Avenue_Aligre_Apres_2020.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Pierre_Auguste_Renoir_Alphonsine_Fournaise_on_the_Isle_of_Chatou_1879_Res_1280_R7AFKYx.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Rue_du_Port_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Republique_Avant_1913.jpg", revision: '383676'},
{url:"media/media/chatou_auto/W_Adam78_Maison_Levanneur.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Rue_Colin_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Tramway_vapeur_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_Nymph\u00e9e_New_9_of_10_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_\u00cele_047_La_Maison_Fournaise_Fa\u00e7ade_laterale_Moonik_W.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Route_de_Maisons_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Rue_Colin_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Gare_013b_Le_Quai_vers_1910.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Mairie_022c_Avenue_Aligre_avant_1905.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Avenue_27_Martyrs_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Gare_011_Fa\u00e7ade_de_la_Gare.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Header_1st_Itinerary_Plan_de_la_forest_du_Vezinet_fait_en_lann\u00e9e_1783_par_Main_premier_arpenteur_en_la_Ma\u00eetrise_des_Eaux_et_Forest_de_St_Germain_1783_Fyrkdlh.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Parc_052b_La_grille_du_Ch\u00e2teau_Probable_erreur_dans_la_description.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Cafe_Hotel_de_Ville_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/De_Vlaminck_Le_pont_de_Chatou_et_lIle_1907.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200Chatou_Bords_de_Seine_030d_Avenue_des_Tilleuls_1911.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Gare_105c_Fun\u00e9railles_Berteaux_1911.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Flourens_Gustave.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Grille_Villa_Lambert_Avant_1915.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Rue_de_la_Paroisse_Apres_vs2.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Pi\u00e8ce_dEau_025_Villa_Lambert.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Mairie_065_Tramway_Vapeur.jpg", revision: '383676'},
{url:"media/media/chatou_auto/BL_Apps_logos_Res_75.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_Nymph\u00e9e_New_7_of_10_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Gare_065_-_Place_du_March\u00e9.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Header_1st_Itinerary_Plan_de_la_forest_du_Vezinet_fait_en_lann\u00e9e_1783_par_Main_premier_arpenteur_en_la_Ma\u00eetrise_des_Eaux_et_Forest_de_St_Germain_1783.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_Nymph\u00e9e_New_1_of_10_Res_1280.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Rue_de_la_Paroisse_Avant_Vers_1960.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Sortie_de_lUsine_Path\u00e9_avant_1908.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Avenue_des_Tilleuls_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Entreprises_Laubeuf_2.jpg", revision: '383676'},
{url:"media/media/chatou_auto/BNF_Gallica_Path\u00e9_Phonographe_Le_Coquet_-_Je_chante_haut_et_clair_.jpeg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Parc_082b_Plan_de_la_propri\u00e9t\u00e9_Bertin_1780.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200Chatou_Berteaux_050_Rue_G\u00e9n\u00e9ral_Colin.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Avenue_27_Martyrs_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Chatou_Landes_020b_Rue_des_Landes.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Pierre-Auguste_Renoir_les_canotiers_\u00e0_Chatou_vers_1879_National_Gallery_of_Art.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Ecole_maternelle_Bousson_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Avenue_des_Tilleuls_1910_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Ancienne_Poste_Avant.jpg", revision: '383676'},
{url:"media/media/chatou_auto/NewChatelet_After_1200.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Res_1200_Header_2nd_Itinerary_Chatou_-_H\u00f4tel_de_Ville_-_Tramway_\u00e0_vapeur_1905.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Chatou_Pi\u00e8ce_dEau_023_Villa_Lambert.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Dans_le_Parc_de_Chatou_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/La_Faisanderie_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/ville-de-chatou_200.jpg", revision: '383676'},
{url:"media/media/chatou_auto/48x48twitter.png", revision: '383676'},
{url:"media/media/chatou_auto/Ancienne_Poste_Apres.jpg", revision: '383676'},
{url:"media/media/chatou_auto/Vue_sur_Ile_Apres_2.jpg", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Bertin.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Villa_Lambert.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Place_Berteaux.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Nymphee_NvBzaKx.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Nymphee_2.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Mairie.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Pathe.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Fournaise.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Faisanderie.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Gare.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Source_Impressionnisme.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Eglise.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Levanneur.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Intro_Histo.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Nymphee.mp3", revision: '383676'},
{url:"media/media/chatou_auto/audio_files/Chatou_Nymphee_3.mp3", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Text_Citation.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Text_Audio.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_comparator_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Big_Telech.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pop_Image_Sharing.png", revision: '383676'},
{url:"static/chatou_auto/static/images/mobile_34484_Going-Blind-Court.mp3", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Epingle_Map_blue.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pop_Map.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Arrow_next_grey.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Arrow_next white_64.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pop_Image_Arrow_Left.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Text_Map.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Logo_Big_Landing.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Arrow_blue_Right.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Big_Audio.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Big_Info.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/arrow.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Arrow_next_grey_64.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Arrow_back_grey_64.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_comparator.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Arrow_back white_64.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Picto_alert.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Left-Arrow_Back.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Epingle_Map_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Logo_small_Footer.png", revision: '383676'},
{url:"static/chatou_auto/static/images/PCT_Arrow_white_Right.png", revision: '383676'},
{url:"static/chatou_auto/static/images/X_Close.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Logo_BlueLion_footer.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Logo_Header.png", revision: '383676'},
{url:"static/chatou_auto/static/images/PCT_Arrow_white_Left.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Big_sharing.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Picto_map.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Big_Map.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pop_Image_+.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Arrow_blue_Left.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pop_Image_Arrow_Right.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Big_Linkedin.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Fav.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Picto_Burger.png", revision: '383676'},
{url:"static/chatou_auto/static/images/Pictos_Map_guidance.png", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/limpre/Pierre_Auguste_Renoir_les_canotiers.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/notice_historique/Roslin_-_Henri-L\u00e9onard_Bertin.png", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/notice_historique/Voiture \u00e0 vapeur et chemin de fer, Anonyme RMN vs 2.JPG", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/notice_historique/BNF Parc du V\u00e9sinet Plan_g\u00e9n\u00e9ral_indiquant_le_lotissement.jpeg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/notice_historique/Camille_Corot_-_La_Seine_a_Chatou_-_Google_Art_Project.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/Header_1st Itinerary_Plan_de_la_forest_du_Vezinet_fait_en_lann\u00e9e_1783_par_Main_premier_arpenteur_en_la_Ma\u00eetrise_des_Eaux_et_Forest_de_St_Germain_1783.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step8/Chatou Entr\u00e9e du Pays - Place du March\u00e9 1910.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step8/Chatou Gare 105c Fun\u00e9railles Berteaux 1911.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step8/Chatou Gare 101 Monument Berteaux.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step8/Chatou Gare 065 - Place du March\u00e9.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step2/Chatou Eglise 06 Vue Aerienne est apr\u00e8s 1960.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step2/Eglise 04.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step4/Nymph\u00e9e New (7 of 10).jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step4/Nymph\u00e9e New (9 of 10).jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step4/Nymph\u00e9e New (1 of 10).jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step4/Chatou Parc 065 Le Nymph\u00e9e 1905.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step7/Chatou Mairie 035 La Mairie.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step7/Chatou_Mairie par Moonik H\u00f4tel de Ville W.JPG", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step6/Path\u00e9_Phonographe_Le_Coquet.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step6/Chatou - Av. de la R\u00e9publique avant 1911.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step6/Chatou La faisanderie.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step6/Chatou R\u00e9publique 041 La Faisand\u00e9rie.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step6/Chatou R\u00e9publique 024 Usines Path\u00e9-Marconi.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step6/Chatou Sortie de lUsine Path\u00e9 avant 1908.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step0/Pierre-Auguste_Renoir_-_Luncheon_of_the_Boating_Party_vs2_Google_Art_Project.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step0/Pierre Auguste Renoir, Alphonsine Fournaise on the Isle of Chatou (1879).png", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step0/Pierre-Auguste_Renoir_les canotiers \u00e0 Chatou, vers 1879 National Gallery of Art.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step0/Chatou \u00cele 047 La Maison Fournaise Fa\u00e7ade laterale Moonik W.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step0/Chatou \u00cele 042 La Maison Fournaise depuis le Pont.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step9/Chatou Gare 013b Le Quai vers 1910.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step5/Chatou Pi\u00e8ce dEau 031 Le petit lac.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step5/Chatou Pi\u00e8ce dEau 023 Villa Lambert.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step3/Chatou Parc 080 Le Ch\u00e2teau Bertin 1910.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step3/Ancienne entr\u00e9e Chateau de la pi\u00e8ce deau.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step1/W Adam78 Maison Levanneur.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step1/Derain_et_Vlaminck_en_1942.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/pages/impressionistes_a/step1/De Vlaminck Le pont de Chatou et lIle 1907.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/backgrounds/Cover_Page_Pierre_Auguste_Renoir_Le_Pont_de_Chatou_Grand.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_Seine.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_Berges.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_accueil.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_Event_brocante.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_MaisonFournaise.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_Chatou.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_Promenade.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_Event_Expo.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_Ulrike.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/Visuels/Vis_Rives.jpg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Transport_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Shopping_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Children_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Place_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Toilets_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Bar_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Restaurant_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Billets_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/red/Pictos_Pictos_info_Horaires_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Shopping_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Transport_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Billets_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Place_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Restaurant_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Horaires_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Children_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Toilets_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/white/Pictos_Pictos_info_Bar_white.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Children.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Bar.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Horaires.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Shopping.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Toilets.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Transport.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Place.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Billets.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/information_box_icons/blue/Pictos_Pictos_info_Restaurant.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/Pictos_Epingle_Map_blue.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/Pictos_Epingle_Map_red.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/Person_location_orange.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/place_holder_marker.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/user_location__marker_1.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/user_location__marker_2.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/PCT_Picto_Geoloc.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/PCT_Picto_Geoloc_50.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/markers/PCT_Picto_Geoloc_51px.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/infowindow/Pictos_Pop_Map_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/infowindow/home_downarrow_blue.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/infowindow/Pictos_Pop_Map_blue.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/infowindow/downarrow_red.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/infowindow/home_downarrow_red.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/infowindow/downarrow_blue.png", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/infowindow/arrow_link_red.svg", revision: '383676'},
{url:"static/chatou_auto/static/images/maps/infowindow/arrow_link_blue.svg", revision: '383676'}];

var cache_files = site_links.concat(image_files);
// workbox.precaching.precacheAndRoute(cache_files, {   urlManipulation: ({url}) => {   return html_files  } });

workbox.routing.registerRoute(({url}) => appShell.includes(url), new workbox.strategies.NetworkFirst());


workbox.routing.registerRoute(
({url}) => !appShell.includes(url),
new workbox.strategies.StaleWhileRevalidate({
  cacheName: 'dynamic-cache',
  plugins: [new workbox.expiration.ExpirationPlugin({
      maxEntries: 5,
  })],
})
);

// Handle offline.
// From https://developers.google.com/web/tools/workbox/guides/advanced-recipes#provide_a_fallback_response_to_a_route
workbox.routing.setCatchHandler(({ event }) => {
console.log(event)
switch (event.request.method) {
  case 'GET':
      return caches.match(OFFLINE_URL);
  default:
      return Response.error();
}
});

}

// self.addEventListener('install', event => {
//   // self.skipWaiting();
//   fetchfiles();
//   media_files = [{"url":"media/media/chatou_auto/Res_1200_Chatou_Parc_051c_Lentrée_du_Parc.jpg","revision":"383676"},{"url":"media/media/chatou_auto/Sequana_Chatou.jpg","revision":"383676"}];

//   const urls = media_files;
//   const cacheName = workbox.cacheNames.runtime;
 

//   event.waitUntil(caches.open(cacheName).then((cache) => cache.addAll(urls)));
// });

serviceWorkerCore();
