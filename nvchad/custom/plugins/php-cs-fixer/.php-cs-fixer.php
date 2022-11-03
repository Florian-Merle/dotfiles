<?php

declare(strict_types=1);

// see https://mlocati.github.io/php-cs-fixer-configurator/#version:3.13
return (new PhpCsFixer\Config())
    ->setRules([
        '@Symfony' => true,
        '@PSR1' => true,
        '@PSR2' => true,
        '@PSR12' => true,
        '@PSR12:risky' => true,
        'trailing_comma_in_multiline' => true,
        'ordered_imports' => [
            'imports_order' => ['class', 'function', 'const'],
            'sort_algorithm' => 'alpha',
        ],
        'declare_strict_types' => true,
        'method_chaining_indentation' => true,
        'array_indentation' => true,
    ])
    ->setRiskyAllowed(true)
;
