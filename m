Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3B7C98304
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 14:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B78410F09E;
	Wed, 23 Sep 2026 14:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="p11XmyTX";
	dkim-atps=neutral
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com
 [74.125.227.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FAB10E052
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 04:15:12 +0000 (UTC)
Received: by mail-vs2-f12.google.com with SMTP id
 71dfb90a1353d-5c67e4fffc0so264796e0c.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2026 21:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1790136911;
 x=1790741711; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EURea47r5X4g8kyHzBjKCelWuNPAmm5ZX+TUa34qlJY=;
 b=p11XmyTXclVyiysulELsZqby/rF8vo4u9Vngzhh+LiCJGb0RvuX6aLv7md3mDDdPQJ
 BPjfvUlfC+dklgpVn7IObboJIFYRzMBW7NHB8aMyq0c8CW5CLbRZ/1GnfN8lDZmZ9dJR
 dJR+h/NWareHDii9fgISEHFfyuUjUWh1DeLfU5B4DW0lsIVpl/c7V0gZ97+1u68lV/G1
 FnI/4oCvMctfEUy2yjK24RmIPDWCB3gFxrZ6BIEH0YxxHwoJ4yGDETPJQqJ0mP3/SpFx
 mpbfYJ17vJE5nZ/4cQHGBfsbqL+6ur36OumXF1bVHlxOIrVIxwIvLpbVIMXk9iHpFX4Q
 82Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790136911; x=1790741711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EURea47r5X4g8kyHzBjKCelWuNPAmm5ZX+TUa34qlJY=;
 b=a/q9x8Q1tizq1S6K8r+ZNB84SUb5zMM61htxldKJ5jNJKiu75SPeHSEsnJVEW9BmoF
 n0NOATGp77NMp3B24lxjncH1pWyz6eNA67nnoePOplYfNdWocXq8LfB4b7KOQktNbscO
 EZUQVqBy9dGeE7yuWhD6jq+ZrWSPxVtsZdEwQBAEmLWMiDMbz/9s1RGKi9kHlb3K5YAE
 Ko6Mx//9mg1V6QFiewSMLk7UCMby1LGjvN0tYG8Y0gmkE9PlquE1HjXufpfpHXfnYK9I
 5/caqF3jZDoKBcsxpvxzXtFyE7KYu0OQSVHg6r8aFBMgTa9rRzRdF+p/Che/Atip8lyH
 1rIQ==
X-Gm-Message-State: AFuF++n4s016BklGiQDtaVgcA3sZrnOghEyBU0rTksteMLCaQx/pjMrz
 KA/D+GzyOTYrnTpqj8bD2iroexDbM2zl6Wf6VDOWRf2QcdaepYqLeMVw6GpKZHojlfbNkOBe1L7
 n8I7gqJ+ohtOkeRhndRIvyVRLcJuq8gwfASIbUZo2vDwxzP+C7ziKn09uOGETXQ2Nil77WoQfBM
 eiO4X0ljublfOdDVMHHQ9c509Xakx7eA8/FAd5lCLjd7fi45y1OBLYSF4=
X-Gm-Gg: AYBFou1q1mV2PSLWtGcHNH5oEeKwFBKvWkuyTM+3k1ItwDF7RfjT3jEoDloGWuE3ja4
 27pU9lzX8p2PC7xCiul0SIbnyOAcps6DpuXMv6MmxdNQ4OHgjGxACGOySe7Tfp1j/hH+Lm2W+lj
 +btEqhfyG4cSbrHdWPZvOHX0Fwi66qTnyOlQ/mQi3ChezbP+N6k554g0HGtRT82avHHCprpnTgs
 01UBLqgQ2f6Q+6YnIpIaLxhSCaUtZoV4mpH/IO84YdkitpwOt/EcI8nde4QnWZH5X2glWPkfYyD
 05d7xEFOSpRHXqjvj+5Mu4r17y9YkONH6QFjpKkppTsD/x2fU2eqkTzDihZoIwFbl2N893ilSN1
 BOO/APxlb2uxdXSW3uNvrrp6GrfSVkI5Kdi9J7BuO6G7/N3ZEFJvXIaZP0d64G6R2iGO3PaXZyS
 loSkG/xeFU9HTNWCFr+bLwNH3L8chpGVrKQDoGpSQD9K2mHDk4X0JfmVK5ABlDeZmeq4wkbwG3h
 0/KeZHTYWHMCkrDU/Tn9vG6MZnEROW7ly52hIUyH5RUBqhn5zvPmTw9cx+rfsZZfAwh2d2iDhqP
 ahHGjE9WsSNZUa5iVEDzm6wBFYbJv99Qj5IJPxTrFHtzvNgpT8Fq
X-Received: by 2002:a05:6102:32c3:b0:7a7:79c5:d440 with SMTP id
 ada2fe7eead31-7ac1b62639amr1256335137.13.1790136911061; 
 Tue, 22 Sep 2026 21:15:11 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::12ac])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-985169f579bsm2286869241.3.2026.09.22.21.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 21:15:10 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, animesh.manna@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead
 of the IO buffer wake
Date: Wed, 23 Sep 2026 00:15:08 -0400
Message-ID: <20260923041508.2148678-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904004308.185788-1-j@metarealtyinc.ca>
References: <20260904004308.185788-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Sep 2026 14:17:20 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Please drop this series (v1 to v3).

The premise was wrong. With the fast wake above the IO buffer wake the
sink stops receiving selective updates at all, which is why the Link
CRC errors went away. That is also the "park" I reported in the bug
thread. With the stock values (fast = io) PSR2 selective update works
on this machine, so my earlier answer to "Is PSR2 working on your
setup with this quirk?" had it backwards: it works without the quirk
and stops with it.

The Link CRC flag at stock is not a failed wake either. The sink does
not resync, so my Sept 8 answer ("every wake fails and the sink
resyncs") was wrong, and so was the Sept 4 reading behind it (SU_VALID
in 2 of 94 polls on 7.2.2). I don't have
a clean explanation for the 2 of 94: that was an unscripted desktop
run, and the sink reported PSR inactive in 44 of those polls. With a
test client driving updates, SU_VALID shows in about 90% of polls.

Jouni, you were right about io >= fast. Thanks for the review and for
sitting through the detour. Details in the bug thread:
https://lore.kernel.org/intel-gfx/20260902162150.58778-1-j@metarealtyinc.ca/

Jake
