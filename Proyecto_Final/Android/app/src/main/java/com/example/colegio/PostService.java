package com.example.colegio;

import java.util.Map;

import Modelo.Estudiante;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface PostService {
    @POST("posts")
    Call<Estudiante> post(@Body Estudiante estudiante);
}
