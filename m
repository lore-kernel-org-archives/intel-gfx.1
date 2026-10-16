Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E741CCF2D6
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 11:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AB110EC55;
	Mon, 19 Oct 2026 11:41:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D058112991
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 18:59:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so91105f8f.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 11:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792177152; x=1792781952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZYcImaxwIvQa5x7FpuhK9EiFT4uMMl80YsgtPQP3AL4=;
 b=ZUhHJ9ADK4vlj2JKgvP3k6lqH9Cx2HbSRR3/Dkkv+3k2+ALdgz0biVQuUPMp7/jAls
 9knZMdroO245Wh6sT1QjiU0+DlH55R/TC2jjntLvgKxLrqX5DvsjrMana8BBwlFsiF83
 JJe5cyA0gesby7KhDtYNzS+N1Frm5cfMkKzCj7ZrgP5o2TmEMnzIdLMzPgLyI1dnOB2S
 1SrB0PkomgpMJ9hFwpm20qcAIt647IbzwtQb+Ywfxb5Tb+ZbjVBlW5zHBySzDG0Bcqwg
 9nwELwVkuqYCNQzhYqhXHU/INfmO7TUFe7zzYr5ctKwtyd8aoOAo1ZA16TtoaS5quIjs
 Sp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792177152; x=1792781952;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZYcImaxwIvQa5x7FpuhK9EiFT4uMMl80YsgtPQP3AL4=;
 b=DGEd/d28hA2dGn7LI4UKEA5rSlEMdA69S/qAqOG16YtZL2zvonSwJaW8b1ShRcAGZa
 R10G++qf5KuOZmN/UZOz+RcmaDL/SiEl1v2JIhA6o0CAsYaFawralZt2yH4nyC2ZmVDK
 Zd57WNHvvbvuMqmqNGB4JbK9WEnBvZvMs3B2DOp7Qn/fpzrOXHxwovLgScDks5/A4wxF
 J5EhgNFyDhjDGUwFFvn4LomD144g0ez3eFIIa1cFXSTDi3KXSa137vsBG7TvckITBavt
 lQanU+1VMZ6Bl+lcQzz0rbWQd8dZcDTBf71nT0hRTcB9oOK3Wjy9SqB0yQgbRVvXqYCl
 oxqA==
X-Gm-Message-State: AFq9FYJzFhyd+CfqxG5ZRZCkK2ksNMOBL3C34iULIh+UsfQUWqhUKYMV
 n5SYSh74gSFT60zmN1T9C5sGkb+8wQnD0hhNLUv8gxtFyYA7QlEVCfX1JVApE/jrOhbhcQ==
X-Gm-Gg: AYBFou3KHop5merPczJPBEVXUokbswSvUemp0pelG/o+Is7XDp7Oxf8hu4qZo2zCDYJ
 w5BUAZyfnRARv5mIlAb93TmZpD95eNBvltQmWYjhZ7nFvolnl0b3W93tzDnh2oWv9V0pYi/eYYl
 rYzfP/TOBA3seNOCFw3f0Sb42LkGwpVrzqL0qyvcZZBEtA84KNPiV1m2pvxL79OA4fgMgYPOhQX
 J51qp9whJ8hnrb3//EjYVeVkZnHDKv0lr0O2YWK5ygVmInaRivtXeQLZUKa7TMiJVK+7Rkic88v
 W0ihh8j1McZPY3s68mHygZi8FNVJb70QSGlbNZ6aRooAnEkrXBNWUuqwxKrkG1k/t1NDcfB6na1
 CpA7eCWLhGwYrC4b6uOGNoc1070T06TeyJhO+tV7ILMJzVyJoIbc/lbw+ExWoHnmsC/3mt6dOFG
 11m8GUKl4masvHnYiMB9c5btEG9hl7XNNeFWOWvfbhTZBLbWFAeWQFPjZrZVklyzzvwA==
X-Received: by 2002:a05:6000:470f:b0:48b:efb:4a66 with SMTP id
 ffacd0b85a97d-48e07978c74mr1088295f8f.6.1792177151597; 
 Fri, 16 Oct 2026 11:59:11 -0700 (PDT)
Received: from burakgon ([88.230.126.16]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4d4dddsm6907711f8f.22.2026.10.16.11.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 11:59:10 -0700 (PDT)
From: =?UTF-8?q?Burak=20G=C3=B6nc=C3=BC?= <burakgon12@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
Subject: Re: [PATCH v2 0/2] drm/i915/cx0: TCSS power for the non-TC C20 PHY on
 PTL port B
Date: Fri, 16 Oct 2026 21:57:09 +0300
Message-ID: <20261016185713.40065-1-burakgon12@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-ptl-port-b-tcss-v2-0-e00ce882402d@gmail.com>
References: <20261015-ptl-port-b-tcss-v2-0-e00ce882402d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:41:45 +0000
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

On Thu, Oct 15, 2026 at 01:26:39AM +0300, Burak Göncü wrote:
> EDITME: v2 test results on the hardware.

Sorry, I sent this with a placeholder left in. The v2 test results:

Tested on an ASUS Zenbook Duo UX8407AA (BIOS 310) running 7.2.9 with
this series applied as is:

- Power-on with the keyboard docked, then lifting it: the panel on
  port B comes up, with no PHY B errors.
- Turning the panel off and on again from userspace, twice: the TCSS
  power state in XELPDP_PORT_BUF_CTL1 of port B follows the request in
  both directions, and neither wait times out.
- s2idle with the panel on: it resumes with the request and the power
  state set, again without errors.

Burak
