### Nom des coéquipiers :
Mathieu Lavoie - 12 101 575  
Félix Baril - 12 108 480  
Alexandre Roy - 12 079 225  
Alex Provencher - 11 173 124  

### Adresse de votre site Web (URL)

http://the3dshop.ca/

### Résumé des efforts SEO :

Résumé de vos efforts

##### S'afficher dans les réseaux sociaux

* Facebook
	* Demander aux amis de partager notre page
	* Demander aux amis de "liker" notre page
* Twitter
	* Demander aux amis de s'abonner

##### Synchroniser avec analytics et Webmaster tools

* Google
	* Ajouter notre siteMap
	* Synchroniser notre site web avec google analytics et google webmaster tools
* Bing et Yahoo
	* Ajouter notre siteMap
	* Synchroniser notre site web avec Bing/Yahoo analytics et Bing/Yahoo webmaster tools

##### Avoir des tag Meta 

* Titre
	* Presque chaque page à un titre significatif
* Description
	* Presque chaque page à une description significative

##### Avoir des tag OG

* Facebook
* Twitter
	

---

### Installation de l'environnement

* Télécharger et installer [Vagrant](https://www.vagrantup.com/)
* Télécharger et installer [Virtual Box](https://www.virtualbox.org/)
* Télécharger la [box](https://drive.google.com/file/d/0B-nuwSqBCh4HanR4dmR1VU9fYm8/view?usp=sharing) contenant Ubuntu

Lorsque tout ceci est fait, vous pouvez lancer ces quelques lignes de commandes dans le dossier où vous allez travailler:

```
vagrant box add the3dshop the3dshop.box
git clone https://github.com/udes-ige511-h2015/TP_Final5-TP_Final.git  
cd TP_Final5-TP_Final
vagrant init the3dshop
vagrant up

vagrant ssh
cd syncedFiles/the3dshop
bundle install
rails server -b 0.0.0.0
```

---

## Travail de session (25 %)

Création, en équipe de 3 à 4, d'un site marchand bien référencé sur les moteurs de recherche ainsi que d'un système d'infolettre.

### Détails du travail de session
* __MOT CLÉ À RÉFÉRENCER__ : _Dortalomu_
* Utilisation d'un CMS de votre choix (Magento, WooCommerce, PrestaShop, etc.);
* Thématique du site autour d'un mot clé qui sera révélé à tous au même moment;
* Achat d'un nom de domaine qui ne doit pas contenir le mot clé ni dans son ensemble, ni en partie, ni avec une faute d'orthographe;
	* Le nom de domaine doit être vierge (création le ou après le 2015-02-12) et doit être approuvé;
* Création de minimum trois pages de contenu, incluant l'accueil (Contact, FAQ, Livraison, etc.);
* Ajout d'un volet transactionnel et d'un minimum de 5 items en vente;
	* Le paiement en ligne doit fonctionner (utilisation de Stripe, PayPal, etc.);
* Ajout d'un système d'envoi d'infolettre au choix avec un gabarit personnalisé en format HTML. Au minimum un article doit être rédigé et inclus dans l'infolettre. Un système de suivi des lectures et des clics doit être utilisé;
* Implémentation d'un module fonctionnel d'abonnement à l'infolettre;
* Connexion avec Google Analytics (ou équivalent);
* Connexion avec Google Webmaster Tools (ou équivalent);
* Choix d'un domaine de préférence (www vs sans www) qui doit être paramétré par une redirection 301 et indiqué dans Google Webmaster Tools;
* Création d'un sitemap.xml et ajout à Google Webmaster Tools (ou équivalent);
* Utilisation d'URLs représentatifs (/produits/montre vs ?produitId=234&cat=1);
* Optimisation du code (erreurs et avertisements) à partir du vallidateur W3C (http://validator.w3.org/);
* Optimisation du temps de réponse à l'aide de Google PageSpeed Insights (http://developers.google.com/speed/pagespeed/insights/);
* Installation du site Web chez l'hébergeur de votre choix (partagé, VPS, etc.);
* Optimisation du référencement du site Web pour Google avec le mot clé révélé;
* Interdiction d'utiliser des techniques de référencement dites « blackhat ».

## Information Git & GitHub

Vous devez utiliser Git de façon appropriée, c'est-à-dire ne pas avoir qu'un gros « commit » et n'effectuer seulement qu'un « push » à la fin du projet. La planification des tâches à faire via les « GitHub Issues » est encouragée. De plus, n'hésitez pas à mentionner les noms des utilisateurs GitHub des enseignants (@allaire et @FreakenK) pour poser des questions à tout moment !

Un README.md contenant de l'information sera déposé dans votre répertoire lors de la remise de l'énoncé du travail de session. Ce fichier doit être conservé et certaines sections devront être complétées.

## Remise

Votre travail de session doit être déposé dans le répertoire Git associé à celui-ci. Un git clone sera effectué à l'heure de remise pour correction.

### Première remise (5%) 

Dans la __semaine du 19 mars__  

* Présentation en personne :
	* des avancements de votre projet;
	* de votre plan de match pour la suite des choses.

### Deuxième remise (20%) 

Au plus tard le __8 avril à 23 h 59__

* URL de votre site Web  (dans le README.md);
* Résumé des efforts SEO (dans le README.md);
* Ensemble des fichiers sources (incluant un fichier SQL permettant de recréer la base de données s'il y a lieu);
* Impression d'écran de Google Analytics démontrant que les statistiques fonctionnent (on doit y voir la courbe de trafic et l'URL du site ou le code UA);
* Impression d'écran de Google Webmaster Tools démontrant qu'un lien est établi;
* Fichier HTML de l'infolettre ainsi que les accès au compte du système d'envoi (si applicable);
* __Vos sites doivent être fonctionnels et accessibles jusqu'au 27 avril 23 h 59__;
* __Vos sites ne doivent pas être modifiés entre la remise et le 27 avril 23 h 59__.

