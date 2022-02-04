const RentHotel = artifacts.require('RentHotel');

module.exports = function(deployer){
    deployer.deploy(RentHotel)
}