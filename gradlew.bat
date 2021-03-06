package com.example.corona.watch

import android.app.Activity
import android.app.AlertDialog
import android.content.ContentResolver
import android.content.ContentUris
import android.content.DialogInterface
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Environment
import android.os.Message
import android.provider.DocumentsContract
import android.provider.MediaStore
import android.widget.ImageView
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.content.FileProvider
import androidx.core.graphics.PathUtils
import androidx.core.net.toFile
import androidx.loader.content.CursorLoader
import com.bumptech.glide.Glide
import com.google.android.gms.tasks.OnCompleteListener
import com.google.android.gms.tasks.OnSuccessListener
import com.google.android.gms.tasks.Task
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.auth.FirebaseUser
import com.google.firebase.auth.GetTokenResult
import com.google.firebase.iid.FirebaseInstanceId
import com.google.firebase.iid.InstanceIdResult
import kotlinx.android.synthetic.main.activity_signal.*
import java.io.File
import java.io.IOException
import java.io.InputStream
import java.text.SimpleDateFormat
import java.util.*

class SignalActivity : AppCompatActivity() {
    val REQUEST_VIDEO_CAPTURE = 2
    val REQUEST_SELECT_IMAGE_IN_ALBUM = 3
    val REQUEST_TAKE_GALLERY_VIDEO = 4
    lateinit var currentPhotoPath: String
    val REQUEST_IMAGE_CAPTURE = 1
    var mUser : FirebaseUser = FirebaseAuth.getInstance().getCurrentUser()!!

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_signal)


        FirebaseAuth.getInstance().getAccessToken(true).addOnCompleteListener {
            val token = it.result!!.token
        