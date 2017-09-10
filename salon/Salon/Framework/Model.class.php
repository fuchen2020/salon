<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/5/27
 * Time: 10:46
 */
abstract class Model
{
    //可以让继承提交中的类都使用该属性.
    protected $db;

    //存放错误信息
    protected  $error;

    public function __construct()
    {
        $this->db = DB::getInstance($GLOBALS['config']['db']);
    }


    /**
     * 获取错误信息
     * @return mixed
     */
    public function getError(){
        return $this->error;
    }

}