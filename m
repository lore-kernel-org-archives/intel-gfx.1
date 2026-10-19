Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59BD60A260D
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kr+5vIa9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486310EBA9;
	Tue, 20 Oct 2026 12:53:44 +0000 (UTC)
Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C4710E9B5
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 16:06:54 +0000 (UTC)
Received: by mail-qk2-f3.google.com with SMTP id
 af79cd13be357-93f25d896bbso6659985a.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1792426014;
 x=1793030814; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r7SqUP92dR9LlFw5I9AVb2JK82RW6iK4WkK2hKZlbeI=;
 b=kr+5vIa9P4MAXiFYXRivzXhJnme3snmJQ+H5HrKpJixXGETMPAcMg3E/+X1zR+zMTV
 v0MJvAcNmIEbnD4waRV9MaA/dMETpuizfxF7sQY9slhc5W8p96DJM4MRA206eXYdT0Ss
 kXcYzocuBckyx5NZvDSX9SdNubcKeJVpyWLBd6rgYc1ot0Dy4QFFTtyBLPMg+4Joh/I9
 V3fE/hjkNkhpIRCT0pnNrJTIDnTukhZMBAoo+vjyZJPJ+zuS5qjHUQ2Kvhk7oCfFyP/c
 NEghnAnrGTwSFo2OVtgyfzMrukZle7aHJxK42MOyE2AKDIFmTs9WyXhD7DZlSCflaVrC
 wiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792426014; x=1793030814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r7SqUP92dR9LlFw5I9AVb2JK82RW6iK4WkK2hKZlbeI=;
 b=xBZgbbcoZeSV8n2GB7Gpkz/AxVxb3V6u7xGAWAeOYzIMw9ZxVJNexHsJNj6gW63Q0O
 9SQ+P9yj/71U23oc2pbZunJvVYZt/AM8V2sQHlqDA6IVYbGhzOK5zZYbmWwapeaY5yQx
 uK+wQaRqvoJ1QAM8aV7qU3EbwGBSMnhhGQSFcAJtUjoZZe0YBmBzyxDez9kAFuoGtv1D
 /dPLiihfg8prIUenEY8idNkL1SJyd3RSa1vW3J57z0TLjG86mlisS1zqYOjgDk/OGC0/
 uq1pr/cy3gb2aK0IN6SxosVd8gJ6zmovLV9IuuNauoNwaz4Xy3VvIyiQ1dFIvlvBpm/r
 96xg==
X-Gm-Message-State: AFq9FYLtU/WT5+eyUMkhlhwGtcuQeBJFsq+I7C+oPZzjVhctEEVDDvdT
 r8GCI9ZxfBFii5Ii6MZhoBQKvv3rpe0IF9/s9k/EeaeVexaYYkbH7dtaIxcrSBlirqA=
X-Gm-Gg: AYBFou0aCJkMfGOENfU9um+euZt8irs+Swb/wRNlvnBJm81rdWJ0fbMpHDWYMAGpuXZ
 d37g1l8naMekkQ15dl7yO3Lj8sPh977gbxfxr8FwxR1D4EIlHc3xV5kyqVXSB/DmAVTJtRmxumf
 ejhor98yPEahwFzG1tgGAzWMV1ZkfNMeY6XOUZiWk9rXAM0PVuqRJccBOCK/x+KsWkFQ3WafSWh
 sy9KxmKsjdRc79PpfQhGLuMKcNgcEZtPLH6T79xIQdRR2kNK+WcUIay8mwh1/pWr200rRh4Rk/m
 cnQqSxaNzPumkFIvsICtZoo4Voap3CreLHf+W7wwcYUtjeOfc3PQU5UJi8jj6jgm8VfhltiPAss
 6mCl7aeN0XebzJCVGpBbf0lxXZ3zafmJPHk/gMTSQSZOHaxJrU3uofuja7/u1cqRqZTsi4g3ze4
 Y9OWXd8hSumZtP2oUovgy+zpmY+WSseUjfJEglfnwAk4RBXH3d8RQDpOIZjQonFbk3e1RZHz7jD
 5TsrSSVxx92mg1Fu6tqxkcgnHKmZ5zAP+QL9ayMLUZhIsf0NinF15+3nGMat+9izn6M066N7zAk
 grY2JnD7Bm+CuHu6a84oYlPuixC7hGGlenTwczJMOLFgM6pnQ9ybV0ydTfbwb1TwCVI/Cbw4uJB
 yXLuLMDymmDik6QoqosVS3N8ek2v6CpLo
X-Received: by 2002:a05:620a:2a16:b0:93f:eed:ea4f with SMTP id
 af79cd13be357-93f29dc672cmr1243203985a.41.1792426013612; 
 Mon, 19 Oct 2026 09:06:53 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f1a0cf9a0sm990303385a.2.2026.10.19.09.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 09:06:53 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Mon, 19 Oct 2026 12:06:51 -0400
Message-ID: <20261019160651.584009-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007083443.647649-1-jouni.hogander@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:42 +0000
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jouni,

Gentle ping on my last mail. With 0x107 bit 6 set, this panel still needs
the AS SDP in PR Active while frames update, and the vblank-gated RFC is
the only change it needs:
https://lore.kernel.org/r/20261006220500.3417572-1-j@metarealtyinc.ca

Still running it here on 7.3-rc5 with no issues. Should I send it as a
patch on top of yours?

Jake
