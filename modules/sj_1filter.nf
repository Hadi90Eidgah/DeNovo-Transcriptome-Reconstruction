
process SJ_1FILTER{

    tag "FILTERING AND POOLING "
    cpus 2
    memory '1 GB'
    publishDir "${params.outdir}/sj_filtered", mode: 'copy'

    input:
    path sjs
    
    output: 
    path 'filtered.out_tab' , emit: filtered

    
    
    script:
    """
    cat *SJ.out.tab | awk '(\$5 > 0 &&  \$7 > 2 && \$6==0)' |  cut -f1-6 | sort | uniq   > filtered.out_tab
    """
    }
