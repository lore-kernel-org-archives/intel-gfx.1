Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC94606A320
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2026 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iDLLrMwh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824D71124D0;
	Thu, 29 Oct 2026 18:59:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6381124F2
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 18:59:11 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so23598405e9.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793300349; x=1793905149; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
 b=iDLLrMwhESqkTZ7HmkWs3YmOMgMO2C+W3wgNBfIeHBYqV3+ceyIObRhqks0qcVjwc7
 A1IfNUFlM+jVR9B/LXbVrncGVbL17EY0kxQ2jFmH2RqQznxWNASdea+lkf5GLcJjQD3r
 F7Pn6zKPES4M8bXaRLulH2zftAmKvi2qNE198kH9zS9VgIJe36iD3U1+yeMkGa9JVwHP
 ST27E5j2pfq8V+kuLqeQ0R3IO4GEPfFrx1bAYl1WbmVqHjg7J7K3VByyNtwpCkyW8qln
 amAtnt5Mk/qVNAqnzzZ/5dLsztza6yQZpKqIGRd2ax/jls8oR3OmQWc1DkQ5yhpXc1I6
 DLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793300349; x=1793905149;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
 b=FKZju9m0s35aW618Y3DaUwSrIVC1u/A+Slqb6FWj1fW7SGLfzF93wl+7ZIpCg4zlno
 6D/RHZB6pO66yKsbYPkisX3fGBI971/Hu3T1pb3QsGGHDVcVPmpNrVI8/9wYuwYQAbQT
 J6C3K9Rk10+a9bJDfSHkkYvoECCF28eNyar+x0vWIVw/89SVB4pHeHfAYsF0KCvMvIUY
 yPIVw1AYJAQcoznRqWPxmZR7Klwmns+il8wv7Lii4dnGGOIHZYT61PNxe4mj+ufAfIrm
 bEhLfKIS2KFeDaOkOuoY2tSQEvpxKYvIeuNiDMQL+ZOjXeoMkxH2AW3FWOkj8lnTq9SW
 Du2w==
X-Forwarded-Encrypted: i=1;
 AKwUvByKwfb7wI2Qpnyhqol387QwFMZKCjusQnP0GLN11sV9rAXAUYzNGp5weDTwkza1pe2gJne+4kyTba4=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKdrp/M1ZCZ8258+tzNJR5+cd4V6FOibDB5blcFk1vJMZV61BwU
 ijPN2Y7vZZpLEEgDDIDeYPUw5F2zNNYGJNULYpkuckeJRrUQLh+SaMwW
X-Gm-Gg: AYBFou2NWuPSmkyxNmNgOdh1kzLoFXwQyIK5hnTM6CqVfGZSDt49/1EBfx5eYfdsfru
 o1qNTCxvdp5NkHLWR3gExfS+DpfmXWLSLt+cTpKF44NlP1f0wZFVWQYtBLPAJZvHCPLlavDvIq9
 YNwTKG3NIWQpGIqMXP1l3MwjEMmjmI9cy7JDZ5AYZMWkso0KfjFnI9F/QVLS3pDhCN/1Km/5o5E
 MOCDhdBylMm9AV1F6qE9Mza4N9vBbBb9W/bPiNHgvWegDcOZUXanH/ruhS3FqzOdX23tKJWvUIx
 A3prB7Gx2d69WAW16tkIiS7PPTfdnQNmJWmRyJ+l7MTUFosIYkTexO7gzY29hbD7KEUQnoIQ5wY
 sg8TODX/QkT+r0Rkv/DN7sP7agkE2K+f7EkjE/PPyPcoS3Ie2t+q3oUqkGVFnUqJML3zNfC/Und
 Y8H6pyLSyBYPt5PnpD09g4cIIySkNS/+5DwAmtjCkyVafcBCpTS+sekc4t4PqxJ+YNXpRtkEo/e
 5j+KfCWF8V3XhyycctvfrNeIqT5jm9a2gCm3rej5/7ORg6mAZ/jzURa6yRXb7jrWaYhRvGJ0lZF
 9WjdyPLQF7JZP/c7v58UYTAY619AZpJOZA8miuGR8p/lBeBFn6al0qsVAy7athuwjilH+MTi1/o
 QfWKezK1mL78iJikvJFbEYtYPuw6WI2PZjFtvl7zSa3C+F2qvqpK4sirtMHdLrjrT+X3LcBd42T
 UdcyjdWwRguhJl
X-Received: by 2002:a05:600d:4121:b0:4a3:59c9:a758 with SMTP id
 5b1f17b1804b1-4a96836988amr152798385e9.32.1793300349381; 
 Thu, 29 Oct 2026 11:59:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf6c76507sm4933955e9.10.2026.10.29.11.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 11:59:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:59:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, netdev@vger.kernel.org,
 imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auOXeGVQG0UHeoQb@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
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
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:

> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>     return now skipped, correctly proceeds.

Pattern C is mostly bugs so this patch should have a Fixes tag since
it fixes bugs.

regards,
dan carpenter


