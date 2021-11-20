<?php

require(__DIR__.'/../vendor/autoload.php');

class Page {
    function about() {
        echo "Page -> about";
    }
    public function contact($f3) {
        echo "Page -> contact. Hello, " . $f3->get('PARAMS.name');
    }

};

$f3 = Base::instance();

$f3->set('AUTOLOAD', 'app/');
$f3->route('GET /hello', 'Controllers\Main->hello');

$f3->route('GET /',
    function() {
        echo 'Hello, world!';
        phpinfo();
    }
);
$f3->route('GET /mem',
    function() {
        echo 'Meme, world!';
    }
);

$f3->route('GET /about', 'Page->about');
$f3->route('GET /contact/@name', 'Page->contact');
$f3->run();