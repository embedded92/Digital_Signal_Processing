/*
 * vector_add_fun.c
 *
 *  Created on: Oct 15, 2019
 *      Author: ramneet
 */
/*
 * standard includes
 */
	#include <stdio.h>
	#include <stdlib.h>
/*
 *  includes for GSL components
 *  	- use double precision
 */
	#include <gsl/gsl_vector_double.h>
	#include <gsl/gsl_matrix_double.h>
	#include <gsl/gsl_rng.h>
	#include <gsl/gsl_randist.h>
/*
size_t gsl_vector *embt_apb(gsl_vector *u, gsl_vector *v)//pass by pointer
 {
	gsl_vector *sum=gsl_vector_calloc(N);
	gsl_vector_add(sum,u);
	gsl_vector_add(sum,v);

	return sum;
 }*/

	int
	main (void)
	{
	  int i, j,N=3;
	  gsl_matrix * u = gsl_matrix_alloc (N,N);
	  gsl_matrix * v = gsl_matrix_alloc (N,N);
	//  gsl_matrix * c = gsl_matrix_calloc (N,N);

	  for (i = 0; i < N; i++)
	    for (j = 0; j < N; j++)
	    {
	      gsl_matrix_set (u, i, j, 0.23 + 100*i + j);
	  	  gsl_matrix_set (v, i, j, 0.23 + 300*i + j);
	    }
	  for (int i = 0; i < N; i++)  /* OUT OF RANGE ERROR */
	   for (int j = 0; j < N; j++)
	      printf ("u(%d,%d) = %g\n", i, j, gsl_matrix_get (u, i, j));

	  for (int i = 0; i < N; i++)  /* OUT OF RANGE ERROR */
	 	   for (int j = 0; j < N; j++)
	 	      printf ("v(%d,%d) = %g\n", i, j, gsl_matrix_get (v, i, j));


/*
	  int gsl_matrix_add(gsl_matrix *c,gsl_matrix *u);//
	  int gsl_matrix_add( c,v);//
	  for (int i = 0; i < N; i++)  //OUT OF RANGE ERROR
		 	   for (int j = 0; j < N; j++)
		 	      printf ("v(%d,%d) = %g\n", i, j, gsl_matrix_get (c, i, j));
*/
	 int mul =embt_mm(u,v);

	  gsl_matrix_free (u);
	  gsl_matrix_free (v);
	  //gsl_matrix_free (w);





	  return 0;
	}
	//******************MULTIPLY
	  gsl_matrix *embt_mm(  gsl_matrix *u, gsl_matrix *v)
		  {
		  // w=uv

		  	gsl_matrix * w = gsl_matrix_alloc (N,N);
		  	  for (int i = 0; i < N; i++)
		  		    for (int j = 0; j < N; j++)
		  		    {
		  		     //element 1 of w matrix
		  		  	gsl_matrix_set(w, i, j, ((gsl_matrix_get (u,i,j)*gsl_matrix_get (v,i,j)))+
		  		  			(gsl_matrix_get (u,i,j)*gsl_matrix_get (v,i,j)));
		  		    }
		  	  for (int i = 0; i < N; i++)  /* OUT OF RANGE ERROR */
		  		 	   for (int j = 0; j < N; j++)
		  		 	      printf ("w(%d,%d) = %g\n", i, j, gsl_matrix_get (w, i, j));
		  }
return w;

