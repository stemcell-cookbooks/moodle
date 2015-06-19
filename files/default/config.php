<?PHP
unset($CFG);
global $CFG;
$CFG = new stdClass();
$CFG->dbtype    = 'pgsql';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'localhost';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'moodle';
$CFG->dbpass    = 'password';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array(
    'dbpersist' => false,
    'dbsocket'  => false,
    'dbport'    => '',   
);
$CFG->wwwroot   = 'http://domain_or_ip';
$CFG->dataroot  = '/usr/local/moodledata';
$CFG->directorypermissions = 02777;
$CFG->admin = 'admin';
require_once(dirname(__FILE__) . '/lib/setup.php');
