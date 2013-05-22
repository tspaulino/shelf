function rateReview(review, value){
  jQuery.ajax({
    type: 'PUT',
    url: '/reviews/' + review,
    data: {
      review: {
        rate: value
      }
    }
  });
}

function createReview(book, value){
  jQuery.ajax({
    type: 'POST',
    url: '/reviews',
    dataType: 'script',
    data: {
      review: {
        rate: value,
        book_id: book
      }
    }
  });
}
