<?php

class Home extends BaseController
{
    public function index()
    {

        $data = [
            'title' => 'opdrachten periode 4'
        ];

        $this->view('home/index', $data);
    }
}