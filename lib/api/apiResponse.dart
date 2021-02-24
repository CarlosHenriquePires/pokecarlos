class ApiResponse<T>{
  Status status;
  String message;
  T data;

  ApiResponse();

  loading(String message){
    this.status = Status.LOADING;
    this.message = message;
  }

  error(String message){
    this.status = Status.ERROR;
    this.message = message;
  }

  completed(T data){
    this.data = data;
    this.status = Status.COMPLETED;
  }

// ApiResponse.loading(this.message) : status = Status.LOADING;
// ApiResponse.completed(this.data) : status = Status.COMPLETED;
// ApiResponse.error(this.message) : status = Status.ERROR;

}

enum Status {LOADING, ERROR, COMPLETED}