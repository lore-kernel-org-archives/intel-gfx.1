Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0118DCD5BD1
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Jun 2026 14:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9362D11341C;
	Mon,  1 Jun 2026 14:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cFrVDbIH";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E86F10F89A
 for <intel-gfx@lists.freedesktop.org>; Fri, 29 May 2026 04:56:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4905529b933so50994335e9.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 28 May 2026 21:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780030584; x=1780635384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adBf9RrkQBUo5197wDvh+qHOpIDrsOpmy75Eg7+7V4w=;
 b=cFrVDbIHKBImb6R2qwG58jqaEr72Zx1avUsdjUF+QAF/l0r3SJXpeiOcf6w4Bgl3Qz
 uX15N9pzwoXTiO3GDEcvMwIfgPAKoJLwyc04geodB5bJpX4r0UuW9ScRUUkOPX1hRfz5
 25iMjbUlc7zX1mCCp+dVOW1Ez0q9cNGB3zXnL3Xslql7UgKaqnIPkbm254oIHVDzqxMx
 EPNsBfbhX5hfgiOCPWQvMnuBBsM1l4+mNRixn00g/u7ETqRqJoFdJmV99QhFlEKQZJqB
 wNdvU4KPeYfmVMwa8SvJWM2cRUCAZ98fEr811qC5wNoetA0oputIB54+C0ZjdxPxX4JH
 XK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780030584; x=1780635384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=adBf9RrkQBUo5197wDvh+qHOpIDrsOpmy75Eg7+7V4w=;
 b=VMZjQuVk7SochWph8ydGzrEI4tdedeBRzu0/R7aNbGhqtwApHnd0IVeeaMK073KTIY
 4aBsP73i1TQpH8r4Sp5A3u7PVMp9sqZQNqkJAIvRhbHUuetW0EfBc9tSeizCyFID6UdQ
 vGXSvRXmGjX0WHVM7+nw09AtRwF38/eIYsvXn54zs2L0+OvGBs8G4NTH/x4R+cZe7dwW
 cYl32LJ9dKLEmvriK7j+6Y0vLcatwU4p7v+hWPuYYorvzvZy+tvcsZLHy/QDbvSzHDEj
 ofPdQAM8B5jVnOr/KkYrEcOPtf1ahVo02Vq7i6FhS3hdpyiAnOZsGp89egvAtUqiaC0J
 I9ww==
X-Gm-Message-State: AOJu0YwgnDZrx7NmXwcH2JgAG+XaCT5gOHbkngWegyJ9wOTVHP3D2I5+
 4pCWLyT+9dzR1jSTRVywkMPdwPEj8nhvVLyAmO6WBxnbvca+Xpa/wfym
X-Gm-Gg: Acq92OF3m98N5p9ci/6PG82iXWCnpoZGRun946YIjiQeNqTXTJ7DtHiWFWCbLwyIhPs
 cTr7fdFZJJw0Jr2oXyuBGZ7oEeM9VczDtnu7bMtHtzCY/mP7tO+RprC35tMeVapLQTu1Rszq/Eo
 ktoGSo2mctoCz1n1Wwgz2ceZXBJuO6Dlohdd8OJvvMQITTR/ZFXN6OBsTrDEzQFNkNRta4vfsst
 swYMhMttYpUeFl82lTYCWJa5yxFW0qtR6CL7cCJUx2qsTBMrDvijMboF1tqWuXxm560Rl5zY1de
 8Uvajz91gGpQkH6qDhz0UhUs/d1vx5nVvcW+vePCb2aNeUMDfFG74fXUN3cmCiXafAC9ht5hV26
 3qwFHM7lPOsJ/5DYmK7N6IRs3qMe951umnbXvAdepCMSO7Ht1dyW8cism1oDIbVR2BWTzPS9cGX
 CdQZBvrChHPIPUN4mTcaNnO1rYqdgBJgkxx39Py3wGlx8qZ5eK+2xixNpmBQ5yCX6Wulng0vg/l
 809
X-Received: by 2002:a05:600c:5806:b0:48a:5501:7995 with SMTP id
 5b1f17b1804b1-4909c0b019amr12400255e9.18.1780030583775; 
 Thu, 28 May 2026 21:56:23 -0700 (PDT)
Received: from JTOLLET-M-FKW7 (232.64.3.89.rev.sfr.net. [89.3.64.232])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c07ee36sm7973715e9.0.2026.05.28.21.56.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 May 2026 21:56:23 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 arun.r.murthy@intel.com, ville.syrjala@linux.intel.com
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Fri, 29 May 2026 06:56:21 +0200
Message-ID: <20260529045621.82540-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
References: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Jun 2026 14:40:34 +0000
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

Hi Ankit, all,

Just checking whether anything else is needed from my side for this patch.

Patchwork shows rev5 with CI.BAT and CI.Full passing, and Arun's Reviewed-by is
present:
https://patchwork.freedesktop.org/patch/726364/

Thanks,
Jerome
