Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C36606A31D
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Oct 2026 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=BceE0c4E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228EB10E826;
	Thu, 29 Oct 2026 18:11:40 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5703F10E835
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 18:11:33 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-6df7f544919so1539433eaf.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Oct 2026 11:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ieee.org; s=google; t=1793297492; x=1793902292; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gLjComLCp2esLTingR9be9ipRIp36YyskRA+PmDaCHo=;
 b=BceE0c4E467mjLtd4irK2w3nJ67W+76K/z7dEyGv/Et4kDkQ7BwYQrUpf8fvRBN3fT
 BnMgcjcdMeW5N07W0LPiqYMUvfMDwtYnE0/Xs7szh88pGJW7PfCvE//ZHc0ESw14f6Pv
 arN78dxTkPoq2w5EtsljNDaW0Le7zeaaD9/UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793297492; x=1793902292;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gLjComLCp2esLTingR9be9ipRIp36YyskRA+PmDaCHo=;
 b=ot4AqqVgyS9PJtJUUZaiRmQHlMAKDxyLerkeZvkuOnS1XVphqI1ONif4DCpv9G/XaR
 2iH5kSZdOFqJ8yr4pxhHWwsLpmJbP+4lfisgdiYamc/9e/o//viae2eD46rIQU2VUIGx
 4e1U2QXFhfgpAGtIgWqt4SZ9Qn5Y566IV2G2k0PTZ9Qq5o10oCZuW4T9a3ysEdGCjh9F
 7gRakOBeworAuSU4wxSK7Yf58pKXz2f3XepmVdvrFI5HhD00ShO94ZPZ1fRBu4LZ1w40
 JdnZerKIz/0XeiZxOHxYC5aFi9uK+ohiy24G84q+T/N90KgnUZkM9QcE0fO5D0v5Swej
 lgLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzXAsiADih7MAaSyA3phzSIetnP0C26y2SOoXMy6VcLBgO1R+ETlkF3/LrJ4HL40mqmUNyA6UhWOk=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIA/bAb4psiEK9ovXKf2o3qWOWAwkpq8KWm4kWisWsljy1Ttdpo
 oz/7sJu/W5yImQSqwnhw/LsNcNrLdj8pNOPjavRBOwvgwB5qN6NY5T5xU4utShGYWw==
X-Gm-Gg: AYBFou3qFfizeXUWjKa+BFrSXB14cRz51YpCQPp1tLUB+HwFwwrPN/pEjw379cbiXs9
 sN576LRuulgI7D0Wj3/SIXLveJnL52gV70Xy3n1xldjI43BboFqllCQlBmQDPwb0vUv/yoNNn+x
 S1LPjRQ3g/l3L7ADWFWfZpG2XKeHE+Cs65+tL/SMYzJsSYTKqxh+sCNI8l7xWiHG9LxovFXqRvl
 84XrX70T6gLdoE03BKWwAxyfYZUJEgHQOHOf3y/DO9qoIyYPS6yKNT2QEG3iGVqVsQB7xrFbr2O
 +O91rlbmwf8SpQIJuP590OPr/OSMfmeuoPxoU2kn1FLY6l9G77oA6F7DJbqBw1Ox9QNn6q55Td6
 GlfmQXDgolZUUgFanWI+Tm5O3gS2WVDpGYPil8cue1GJnZwKzZ6ZXAmPY58lvOL1bGiXUcWyfxp
 Al9G5EY9j0ZQtyoZm6McknLv17knvbpO+8TnY8aYzIpMcqKKsVPp/m42f9V1KnSlgeuHgKOvQLV
 mr0sTLXm1wUV5LvQ3XWg8OK53VXxFLuic9kWKwKyX/rugl23STELdZXennbAJe9pAVYCIww3pll
 BsQKRGdzhQCbVc1muPit5XE0Vg9TPuW40+sDF1kyIVcwNg==
X-Received: by 2002:a05:6820:5710:10b0:6de:aeea:5c89 with SMTP id
 006d021491bc7-714f288a10fmr36729eaf.23.1793297492247; 
 Thu, 29 Oct 2026 11:11:32 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-4a904856f09sm130363fac.3.2026.10.29.11.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 11:11:31 -0700 (PDT)
Message-ID: <4c7a6635-7382-4e57-ae16-6bc2ee694f46@ieee.org>
Date: Thu, 29 Oct 2026 13:11:29 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 11:30 AM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> When CONFIG_PM is not enabled, all devices runtime PM state should be
> treated as active.

Should be treated as if runtime PM were enabled for the device,
and the runtime status is active.

It's a subtle distinction but the previous behavior returned
EINVAL, which means "runtime PM is disabled for the device".

Anyway, for the IPA use of this function, this looks correct.

Acked-by: Alex Elder <elder@riscstar.com>

> 
> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Analysis of all callers and their behavior with old (-EINVAL) vs new (1):
> 
> Pattern A: if (!pm_runtime_get_if_active(dev)) -- no impact
>    Both -EINVAL and 1 are non-zero, so !ret is false in both cases.
>    Callers: drivers/accel/ethosu/ethosu_perfmon.c,
>             drivers/gpu/drm/msm/adreno/a6xx_gmu.c,
>             drivers/gpu/drm/msm/msm_perfcntr.c,
>             drivers/gpu/drm/v3d/v3d_mmu.c,
>             drivers/gpu/drm/v3d/v3d_perfmon.c (x4),
>             drivers/media/i2c/gc08a3.c gc05a2.c og0ve1b.c ov6211.c,
>             drivers/media/i2c/ccs/ccs-core.c s5kjn1.c lm3560.c (x2),
>             drivers/media/i2c/s5k3m5.c thp7312.c imx283.c ov64a40.c,
>             drivers/media/pci/intel/ipu6/ipu6-buttress.c,
>             sound/hda/core/device.c
> 
> Pattern B: if (!ret) after get -- no impact
>    Both -EINVAL and 1 are non-zero, !ret is false in both cases.
>    drivers/gpu/drm/amd/pm/amdgpu_pm.c (comment says "allow access"
>      in kernels without CONFIG_PM), drivers/pci/pci.c
> 
> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>    drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>      -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>    drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>      spuriously triggered WARN. Fixed: 1 > 0, no warn.
>    drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>      -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>    drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>      Fixed: proceeds correctly without CONFIG_PM.
>    drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>      (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>      xe_pxp.c) now correctly treat !CONFIG_PM as active.
>    drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>      executes stall register update.
>    drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>      return now skipped, correctly proceeds.
> 
> Pattern D: explicit -EINVAL check
>    drivers/hwmon/prom21-xhci.c: checks (> 0) then (== -EINVAL).
>      Old: took -EINVAL fallback. New: takes (> 0) fast path.
>      Both succeed when CONFIG_PM is disabled; functionally equivalent.
>    drivers/hwmon/eic7700-pvt.c: call is guarded by IS_ENABLED(CONFIG_PM),
>      stub is never reached. No impact.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Cc: Karol Wachowski <karol.wachowski@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: "Joerg Roedel" <joro@8bytes.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Guan-Yu Lin <guanyulin@google.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux.dev
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Cc: netdev@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: Rob Herring (Arm) <robh@kernel.org>
> ---
>   include/linux/pm_runtime.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 64921b10ac74f..de9e7518ecef2 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -280,7 +280,7 @@ static inline int pm_runtime_get_if_in_use(struct device *dev)
>   }
>   static inline int pm_runtime_get_if_active(struct device *dev)
>   {
> -	return -EINVAL;
> +	return 1;
>   }
>   static inline int __pm_runtime_set_status(struct device *dev,
>   					    unsigned int status) { return 0; }

