ds.installer =
  run: () ->
    $('body').html("
      <div id='installer'>
        <div id='installer-content'>
          <dic class='icon-repo'></div>
          <h1>Logbook</h1>
          <h4>Add this app to your home screen.</h4>
          <p>(Tap the square button with an arrow pointing up.)</p>
        </div>
      </div>
    ")
