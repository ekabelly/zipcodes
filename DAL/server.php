<?php
require 'db.php';
require 'place.php';

class Route {

	public function __construct(){
		if (isset($_GET['country'])) {
			if (isset($_GET['zip'])) {
				$res = $this->fetchPlacesFromDb();
				if ($res) {
					echo json_encode($res);
					return;
				}else{
					$res = $this->fetchPlacesFromApi();
					if ($res) {
						$this->placesFromApiToDb($res);
						$places = $this->arrangeRes($res);
						echo json_encode($places);
						return;
					}else{
						$result['status'] = 'failed';
						$result['messege'] = 'no places found';
						echo json_encode($result);
						return;
					}
				}
			}else{
				$res['status'] = 'failed';
				$res['messege'] = 'please fill a zip code';
				echo json_encode($res);
				return;
			}
		}
	}

	private function fetchPlacesFromDb(){
		$place = new Place();
		$res = $place->fetchPlaces();
		return $res;
	}

	private function fetchPlacesFromApi(){
		$zip = $_GET['zip'];
		$country = $_GET['country'];
		error_reporting(E_ALL ^ E_WARNING);
		$response = file_get_contents("http://api.zippopotam.us/$country/$zip");
		return $response;
	}

	private function placesFromApiToDb($data){
		$decoded = json_decode($data, true);
		$places = $decoded['places'];
		$place = new Place();
		$zipId = $place->insertNewZip();
		foreach ($places as $key => $value) {
			$res = $place->insertPlace($value, $zipId);
		}
	}

	private function arrangeRes($res){
		$places = [];
		$result = json_decode($res, true);
		foreach ($result['places'] as $key => $value) {
			array_push($places, ['place' => $value['place name'], 'latitude' => $value['latitude'], 'longitude' => $value['longitude']]);
		}
		return $places;
	}
}

$route = new Route();

?>