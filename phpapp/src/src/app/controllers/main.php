<?php

namespace Controllers;

class Main {
    public function hello(\Base $f3, array $args = []): void {
        echo "Hello! This was a " . $f3->VERB
    }
}