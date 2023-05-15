const LandSale = artifacts.require("LandSale");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("LandSale", function ( accounts ) {
  it("The contract are deployed correctly", async function () {
    instance = await LandSale.deployed();
    assert.isNotNull(instance.address);
  });

  it("Create a new land asset", async function () {
    await instance.registerNewLand(101, "KalSel", "Batola", "Mandastana", 08, 10000, 500, {from: accounts[0]})
    const data = await instance.getLandDetails(0);
    assert.equal(data[0], 101);
    assert.equal(data[1], "KalSel");
    assert.equal(data[2], "Batola");
    assert.equal(data[3], "Mandastana");
    assert.equal(data[4], 08);
    assert.equal(data[5], 10000);
    assert.equal(data[6], 500);

  });
});
