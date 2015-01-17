ds.installer =
  run: () ->
    $('body').html("
      <div id='installer'>
        <div id='installer-content'>
          <h1>Logbook</h1>
          <h5>Add this app to your home screen.</h5>
          <p>(Tap the square button with an arrow pointing up.)</p>
        </div>
      </div>
    ")
