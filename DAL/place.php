<?php


class Place {

	private $country;
	private $zip;
	private $name;
	private $lat;
	private $long;

	public function __construct(){
		$this->zip = $_GET['zip'];
		$this->country = $_GET['country'];
	}

	public function fetchPlaces(){
		$query = $this->findPlaceQuery();
		$db = DB::getInstance();
		$result = $db->conn($query);
		$res = $db->createDataArr($result);
		return $res;
	}

	private function findPlaceQuery(){
		$query = "SELECT places.id, places.name as place, places.latitude, places.longitude FROM places
		inner join zipcodes on places.zipcode = zipcodes.id
		INNER join countries on zipcodes.country = countries.id
		where zipcodes.zipcode = '$this->zip' and countries.code = '$this->country'";
		return $query;
	}

	public function insertNewZip(){
		$countryId = $this->fetchCountry();
		$query = $this->insertZipQuery($countryId);
		$db = DB::getInstance();
		$res = $db->conn($query);
		$id = mysqli_insert_id($db->getConn());
		return $id;
	}

	private function insertZipQuery($countryId){
		$query = "INSERT INTO `zipcodes`(`zipcode`, `country`) VALUES ('$this->zip', '$countryId')";
		return $query;
	}

	public function insertPlace($place, $zipId){
		$this->setProps($place);
		$query = $this->insertPlaceQuery($zipId);
		$db = DB::getInstance();
		$res = $db->conn($query);
		return $res;
	}

	private function insertPlaceQuery($zipId){
		$query = "INSERT INTO `places`(`name`, `latitude`, `longitude`, `zipcode`) VALUES ('$this->name', '$this->lat', '$this->long', $zipId)";
		return $query;
	}

	public function fetchCountry(){
		$db = DB::getInstance();
		$res = $db->conn("select id from countries where code = '$this->country'");
		$row = mysqli_fetch_row($res);
		return $row[0];
	}

	private function setProps($place){
		$this->name = $place['place name'];
		$this->lat = $place['latitude'];
		$this->long = $place['longitude'];
	}
}

?>