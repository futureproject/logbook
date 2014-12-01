ds.installer =
  run: () ->
    $('body').html("
      <div id='installer'>
        <div id='installer-content'>
          <dic class='octicon octicon-repo'></div>
          <h1>Logbook</h1>
          <hr>
          <h4>Add to home screen</h4>
          <p>(It's the square button with an arrow pointing up.)</p>
        </div>
      </div>
    ")
