<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Pterodactyl') }} — Life Axis</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    @section('scripts')
        {!! Theme::css('assets/css/life-axis-core.css') !!}
        {!! Theme::css('assets/css/life-axis-components.css') !!}
    @show
</head>
<body class="bg-[#0b0c10] text-[#e2e8f0]">
    @section('content')
        @yield('above-container')
        <div id="app"></div>
        @yield('below-container')
    @show
    
    @section('footer-scripts')
        {!! Theme::js('assets/js/life-axis-init.js') !!}
    @show
</body>
</html>