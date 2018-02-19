<?php

class DB {
	private $conn;
	private static $instance;
	private $host = 'localhost';
	private $username = 'root';
	private $pass = '';
	private $_db = 'zipcodes';

	private function __construct(){
		$this->conn = mysqli_connect($this->host, $this->username, $this->pass, $this->_db);
		if (mysqli_connect_error()) {
			trigger_error("Failed to conencto to MySQL: " . mysql_connect_error(),
				E_USER_ERROR);
		}
	}

	public static function getInstance(){
		if (!self::$instance) {
			self::$instance = new self();
		}
		return self::$instance;
	}

	private function __clone(){}

	public function getConn(){
		return $this->conn;
	}

	public function close(){
		unset($this->conn);
	}

	public function conn($query){
		$conn = $this->getConn();
		$result = mysqli_query($conn, $query);
		return $result;
	}

	public function createDataArr($result){
		$res = [];
		$row = mysqli_fetch_assoc($result);
		while($row){
			array_push($res, $row);
			$row = mysqli_fetch_assoc($result);
		}
		return $res;
	}
}

?>