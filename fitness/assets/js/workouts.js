import socket from './socket';

$(function () {
  let id = $('#id').data('id');
  if (!id) return;

  let channel = socket.channel('workouts:' + id, {});

  channel.on('update_places', (workouts) => {
    console.log('Update', workouts);
    $('h4 span').text(workouts.places);
  });

  channel
    .join()
    .receive('ok', (resp) => {
      console.log('Joined successfully workout:' + id, resp);
    })
    .receive('error', (resp) => {
      console.log('Unable to join', resp);
    });
});
