# Customização do osTicket com Docker

Este projeto contém as especificações básicas para executar uma instância padrão do osTicket em português do Brasil em um ambiente Docker. Além da construção inicial do Docker, há uma segunda etapa de configuração via interface gráfica que requer um servidor de banco de dados MySQL ou MariaDB disponível.

## Pré-requisitos

Certifique-se de ter os seguintes requisitos instalados antes de começar:

- [Docker](https://www.docker.com/)
- Servidor de Banco de Dados MySQL ou MariaDB

## Instalação

1. Clone este repositório:

   ```bash
   git clone https://github.com/sepep-pmsp/smae_help.git
   ```

1. Navegue até o diretório do projeto:

    ```bash
    cd smae_help
    ```

1. Construa a imagem do container

    ```bash
    docker compose -f docker-compose.dev.yml build
    ```

1. Inicie os containers:

    ```bash
    docker-compose up -d
    ```

1. Acesse a interface gráfica no navegador para a segunda etapa de configuração.

## Configuração Adicional

Após iniciar os containers, abra seu navegador e vá para: http://localhost:8080/setup

Siga as instruções na interface para configurar o osTicket e conectar ao seu servidor de banco de dados.

***Nota 1:*** O instalador se baseia no checksum MD5 do arquivo com o schema do banco de dados *com terminações de linha no padrão UNIX (lf)* para calcular os patches necessários. Para que o build funcione é necessário se assegurar que o arquivo `setup/inc/streams/install-mysql.sql` esteja usando terminações de linha lf ou configurar o repositório todo para utilizar terminações UNIX com:

```bash
git config core.eol lf
git config core.autocrlf false

rm -rf * .env* .gitignore

git reset --hard HEAD
```

***Nota 2:*** Certifique-se de colocar os dados de acesso e credenciais compatíveis com os utilizados no arquivo `docker-compose.dev.yml`.

## Licença

Este projeto é licenciado sob a licença Affero General Public License (AGPLv3).

Abaixo, temos o readme original do osTicket.
=============================================

osTicket
========
<a href="https://osticket.com"><img height="80px" width="80px" src="images/favicon.png"
align="left" hspace="10" vspace="6"></a>

**osTicket** is a widely-used open source support ticket system. It seamlessly
integrates inquiries created via email, phone and web-based forms into a
simple easy-to-use multi-user web interface. Manage, organize and archive
all your support requests and responses in one place while providing your
customers with accountability and responsiveness they deserve.

How osTicket works for you
--------------------------
  1. Users create tickets via your website, email, or phone
  1. Incoming tickets are saved and assigned to agents
  1. Agents help your users resolve their issues

osTicket is an attractive alternative to higher-cost and complex customer
support systems; simple, lightweight, reliable, open source, web-based and
easy to setup and use. The best part is, it's completely free.

Requirements
------------
  * HTTP server running Microsoft® IIS or Apache
  * PHP version 8.1 - 8.2 (8.2 recommended)
  * mysqli extension for PHP
  * MySQL database version 5.5 (or greater)

### Recommendations
  * fileinfo, gd, gettext, imap, intl, json, mbstring, Zend OPcache, phar,
    xml, xml-dom, and zip extensions for PHP
  * APCu module enabled and configured for PHP

Deployment
----------
osTicket now supports bleeding-edge installations. The easiest way to
install the software and track updates is to clone the public repository.
Create a folder on you web server (using whatever method makes sense for
you) and cd into it. Then clone the repository (the folder must be empty!):

    git clone https://github.com/osTicket/osTicket

And deploy the code into somewhere in your server's www root folder, for
instance

    cd osTicket
    php manage.php deploy --setup /var/www/htdocs/osticket/

Then you can configure your server if necessary to serve that folder, and
visit the page and install osTicket as usual. Go ahead and even delete
setup/ folder out of the deployment location when you’re finished. Then,
later, you can fetch updates and deploy them (from the folder where you
cloned the git repo into)

    git pull
    php manage.php deploy -v /var/www/htdocs/osticket/

Upgrading
---------
osTicket supports upgrading from 1.6-rc1 and later versions. As with any
upgrade, strongly consider a backup of your attachment files, database, and
osTicket codebase before embarking on an upgrade. Please review our [Upgrade
Guide](https://docs.osticket.com/en/latest/Getting%20Started/Upgrade%20and%20Migration.html)
or the [UPGRADING.txt file](UPGRADING.txt) for upgrade instructions.

Help
----
Visit the [Documentation](https://docs.osticket.com/) or the
[forum](https://forum.osticket.com/). And if you'd like professional help
managing your osTicket installation,
[commercial support](https://osticket.com/support/) is available.

Contributing
------------
Create your own fork of the project and use
[git-flow](https://github.com/nvie/gitflow) to create a new feature. Once
the feature is published in your fork, send a pull request to begin the
conversation of integrating your new feature into osTicket.

### Localization
[![Crowdin](https://badges.crowdin.net/osticket-official/localized.svg)](https://crowdin.com/project/osticket-official)

The interface for osTicket is now completely translatable. Language packs
are available on the [download page](https://osticket.com/download). If you
do not see your language there, join the [Crowdin](https://crowdin.com/project/osticket-official)
project and request to have your language added. Languages which reach 100%
translated are are significantly reviewed will be made available on the
osTicket download page.

The software can also be translated in place in our [JIPT site](http://jipt.i18n.osticket.com).
Once you have a Crowdin account, login and translate the software in your browser!

Localizing strings in new code requires usage of a [few rules](setup/doc/i18n.md).

License
-------
osTicket is released under the GPL2 license. See the included LICENSE.txt
file for the gory details of the General Public License.

osTicket is supported by several magical open source projects including:

  * [Font-Awesome](https://fontawesome.com/)
  * [HTMLawed](https://www.bioinformatics.org/phplabware/internal_utilities/htmLawed)
  * [jQuery dropdown](https://labs.abeautifulsite.net/jquery-dropdown/) (Project Deleted)
  * [jsTimezoneDetect](https://pellepim.bitbucket.org/jstz/)
  * [laminas-mail](https://github.com/laminas/laminas-mail)
  * [mPDF](https://github.com/mpdf/mpdf)
  * [PasswordHash](https://www.openwall.com/phpass/)
  * [PEAR](https://pear.php.net/package/PEAR)
  * [PEAR/Auth_SASL](https://pear.php.net/package/Auth_SASL)
  * [PEAR/Mail](https://pear.php.net/package/mail)
  * [PEAR/Net_SMTP](https://pear.php.net/package/Net_SMTP)
  * [PEAR/Net_Socket](https://pear.php.net/package/Net_Socket)
  * [PEAR/Serivces_JSON](https://pear.php.net/package/Services_JSON)
  * [php-gettext](https://launchpad.net/php-gettext/)
  * [phpseclib](https://phpseclib.sourceforge.net/)
  * [Spyc](https://github.com/mustangostang/spyc)
