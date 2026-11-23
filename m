Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E52606A327
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEpbKvAT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103D010E31C;
	Mon, 23 Nov 2026 03:15:58 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669EF10E31C
 for <intel-gfx@lists.freedesktop.org>; Mon, 23 Nov 2026 03:15:52 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3b3af93b85cso1543392a91.1
 for <intel-gfx@lists.freedesktop.org>; Sun, 22 Nov 2026 19:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795403752; x=1796008552; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tM7CoyIwY3mBBJWEKLWnIG7fS4CdbQVru8+n4SDpDTA=;
 b=eEpbKvAT5WsjPiATYe8LGTmUOxvonVZnzrAgfQ5qq8oyhj2lDTKL9wXUW8CqPX6+IE
 E6DpDX0XoIjj2xLRBGpKcP/qlDNvZSt3PjTzGy7KxmZbGMZm9uAYbAZLWdJqBaXbkE/J
 xlDadtnWfhAjCRY6f8LN9OP7ZnEtnkKdu0B9hpH3+PfNyx/mYrDrO54ts/yjhdUEf5gn
 Tk5xWaenf3iVgqkdfOAryZ0CdE0Ahs4YahUqytri8BW5aNV38XbksvcYgBfV6nYi3WYs
 jdYPqIP81mSmVCuzNHNmr/wYY7SKD6UqpylFeyQ90XlIk6uACmPvo17jFzTmW57yC+nA
 2tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795403752; x=1796008552;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=tM7CoyIwY3mBBJWEKLWnIG7fS4CdbQVru8+n4SDpDTA=;
 b=qScL8ZcQd2YtnqAN3FwzLyVnfefi5IdYkTCLeOCvr3jaxGuyImSj7VWSzwhiPexQtj
 /HC4/HxDECmSNKob7IfYPCmOUKv3IIPXJ5IYd36npBR3t7hw6ydpkiJA/wsPnGg8TQGA
 aRZWuptLvOkwct3amrpaiHo0KK5SiezDHkFjy4/owPi4TF9w4f0o42q1zGtxebU+r4up
 N5Hz1We4YeIU5pQIxSKIhHxBw8r2naRCrmBIK+A8zNl8eAkdahnWmZabWEHWvhOBdit6
 eR+5IsKnewfu0klFQ60KPNAkMQbEShd37Qs8+gxD2LmK4SQFjbq4CagXgVmofHDaPFga
 cCIQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEcFEdsgp0LrFQCEC0b2061zhyXWlMOLWD4sonafA0QVaHwxxIasW2pfzL/buhqDJq/DFgT7gDGb44=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+/MPudcZ8t1BbqhYcNlatVzeDCkfLGjmZoJAkiTdorI6qVzF7h
 rfrpwxZVb5sfWZr52KjLpSfAxBcxj31Rb5RPXNs5BPWGVStJr23bv4sZkdXN/Q==
X-Gm-Gg: AZFdTZcKY7vvPlqXr0rszuTKWduPj/746PltQm+Bin55ab2VjrQa5Dhufjmj03pek7s
 j/9Y/qI6v+ARATSqmPwMqyf+lp7XX70b7FMH2PqyPKyRaVSL43tiAi5k+Hm2kktyGJguIgZuXHz
 WgvWyWAH2oj5t+txMwc5Lxx1grdOiTOVapdhwo8hrb8UT4usQU/zFqJx4kkBMG0AAh1YuVz9Abm
 LnDyLyy6dT9zNTdcww3VT5eGFxz2ZZhhGzn9MyyRUFJZEECv7Z4tWGLZRvV8PmUoTkQQF/7hFPz
 IJb1pOchKR25Sb1/HBfoJ5cOm5PfcfmQYR2eRA1wA+hiKI7DqCpawdLXpFkWDCsplkbAGek6ils
 4wBVWjlOjDJcgPR3rY6E7qnEL4Pubm+3ddNG3/TJN6mfbGT+OrHgKcoBLjT1P4uf8uZi04pxvHE
 ZBC/sJUED5/vj3z14z4p7vogpCdgvvh9pr4Efnn5SVWaRVIlj4W5tqi7EyzWbEZVHZDJ9pAgRrE
 L4n+a7OPJQe27izKQ4yXmoJI9N9zLM32kaIDBS2TpYL5oRz2QLl5pqHQWg/Wyz3OAppRQrYQoFp
 4+s9PAIj5++JpL4xdfulUsc7ne8Ff/4rRKI=
X-Received: by 2002:a17:90b:2b4c:b0:3b0:a7b5:c037 with SMTP id
 98e67ed59e1d1-3b41c7b6145mr9635414a91.1.1795403751833; 
 Sun, 22 Nov 2026 19:15:51 -0800 (PST)
Received: from localhost ([2400:2650:24e0:bf00:cc77:213f:afc3:65e2])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b409330ae8sm18368762a91.7.2026.11.22.19.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 19:15:51 -0800 (PST)
Date: Mon, 23 Nov 2026 12:15:49 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/gvt: Descend to GVT Makefile through
 kbuild, not include
Message-ID: <awOv5SfoKabE-vBR@dell-wzy>
References: <20261120155734.259742-1-jani.nikula@intel.com>
 <20261120155734.259742-2-jani.nikula@intel.com>
 <awBxf9ixOpSQpj1q@intel.com>
 <40de34776e441b082b4dfa5e1d76ef933ea303e7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40de34776e441b082b4dfa5e1d76ef933ea303e7@intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 07:04:22PM +0200, Jani Nikula wrote:
> On Fri, 20 Nov 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Nov 20, 2026 at 05:57:34PM +0200, Jani Nikula wrote:
> >> Treat the gvt/ subdirectory and Makefile like a regular kernel driver
> >> directory, and descend to it through kbuild, not Makefile include.
> >> 
> >> The main change is that the resulting kvmgt.ko is also placed in the
> >> gvt/ subdirectory in the build directory.
> >
> > Does this also change where the module gets installed finally?
> 
> Probably. If anyone depends on the exact location, they'll be hosed.
> 

No, I don't think anyone depends on that, as long as module deps
handled it fine.

Reviewed-by: Zhenyu Wang <zhenyuw.linux@gmail.com>
