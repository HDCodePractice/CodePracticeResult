using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{

    enum State
    {
        normal,     // 0
        sky,        // 1
        crouch      // 2
    }

    private State state;
    private Rigidbody2D rb;
    private Animator anim;
    private SpriteRenderer sr;
    private BoxCollider2D coll;
    [SerializeField]
    private float speed = 7f;
    [SerializeField]
    private float jumpHight = 7f;
    [SerializeField]
    private LayerMask jumpableGround;

    // Start is called before the first frame update
    void Start()
    {
        state = State.normal;
        rb = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
        sr = GetComponent<SpriteRenderer>();
        coll = GetComponent<BoxCollider2D>();
    }

    // Update is called once per frame
    void Update()
    {
        Vector2 movement;
        float runSpeed = speed;
        movement.y = rb.velocity.y;

        if (isGrounded() && Input.GetButtonDown("Jump"))
        {
            movement = Vector2.up * jumpHight;
        }

        if (Input.GetButton("Fire1"))
        {
            anim.SetTrigger("attack");
        }


        if (isGrounded())
        {
            state = State.normal;
            if (Input.GetButton("Fire3"))
            {
                state = State.crouch;
                runSpeed = speed / 2;
            }
        }
        else
        {
            state = State.sky;
        }

        movement.x = Input.GetAxis("Horizontal") * runSpeed;

        if (movement.x < 0)
        {
            sr.flipX = true;
        }
        else if (movement.x > 0)
        {
            sr.flipX = false;
        }

        anim.SetBool("isRunning", movement.x != 0);
        anim.SetFloat("yVelocity", movement.y);
        anim.SetInteger("state", (int)state);
        rb.velocity = movement;
    }

    private bool isGrounded()
    {
        return Physics2D.BoxCast(
            coll.bounds.center,
            coll.bounds.size,
            0f,
            Vector2.down,
            0.1f,
            jumpableGround
            );
    }
}
